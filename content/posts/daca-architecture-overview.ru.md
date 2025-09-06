---
title: "DACA/AdalQarau: архитектура аналитики госзакупок"
date: 2025-09-02
tags:
  ["Go", "gRPC", "PostgreSQL", "MinIO", "Architecture", "Clean Architecture"]
categories: ["Side Project", "Architecture"]
draft: false
cover:
  image: "/images/posts/daca-architecture.svg"
  alt: "Логотип AdalQarau"
  caption: "Логотип проекта AdalQarau"
---

> Эта статья — не просто список фактов, а связный рассказ о том, **зачем** мы выбрали такую архитектуру, **как** она устроена изнутри и **какие практические задачи** решает каждый блок. Текст задуман как «сквозной тур» по системе AdalQarau: от внешнего контура и сетевой топологии — до бизнес‑правил, пайплайнов Excel и стратегии деплоя на self‑hosted инфраструктуре под зонтиком Cloudflare.

Комплексная система анализа государственных закупок, построенная на современных принципах архитектуры с разделением ответственности, type-safe контрактами и автоматизацией процессов. Ни один фрагмент знаний не потерян: диаграммы, схемы, кодовые фрагменты и точные параметры оставлены и дополнены контекстом — чтобы читатель понял не только «что есть», но и «почему так».

## Зачем эта архитектура и кому она нужна

AdalQarau создавалась как **прикладная аналитическая платформа** для госзакупок: выявлять аномалии, строить рисковые профили, ускорять проверку гипотез и давать прозрачные отчёты. Нам нужен был **контракт‑first API**, детерминированная фонова́я обработка, строгая типобезопасность и инфраструктура, которая надёжно живёт **в Казахстане** (вблизи основной аудитории), но при этом **без белого IP**, за счёт защищённого туннеля через Cloudflare.

---

## Обзор архитектуры

Система построена по принципу модульной архитектуры с чётким разделением слоёв и использованием современного технологического стека. Ниже — «карта местности», где видно, как клиенты попадают на Edge, как трафик уходит в защищённый туннель Warp и как сервисы взаимодействуют внутри self‑hosted окружения.

### Общая архитектура системы

```mermaid
graph TB
    Client[👥 Клиенты] --> CF[☁️ Cloudflare Edge]
    CF --> WARP[🔒 Cloudflare Warp]
    WARP --> SERVER[🖥️ Сервер в Казахстане<br/>Без белого IP]

    subgraph "🌍 Cloudflare Global Network"
        CF
        WARP
        CFLint[⚖️ Load Balancer]
        CF --> CFLint
        CFLint --> WARP
    end

    SERVER --> API[🚀 daca-api :7000]

    API --> DB[🗄️ PostgreSQL]
    API --> S3[📦 MinIO/S3]
    API --> Vault[🔐 HashiCorp Vault]

    Jobs[⚙️ Background Jobs] --> DB
    Jobs --> S3
    Jobs --> TG[🤖 Telegram Bot API]

    API --> TG
    TG --> Users[👨‍💼 Пользователи Telegram]

    subgraph "🇰🇿 Self-Hosted Infrastructure (Kazakhstan)"
        SERVER
        API
        Jobs
        DB
        S3
        Vault
    end

    style CF fill:#f39c12,stroke:#e67e22,stroke-width:3px,color:#fff
    style WARP fill:#e67e22,stroke:#d35400,stroke-width:3px,color:#fff
    style SERVER fill:#27ae60,stroke:#229954,stroke-width:3px,color:#fff
    style API fill:#3498db,stroke:#2980b9,stroke-width:3px,color:#fff
    style DB fill:#9b59b6,stroke:#8e44ad,stroke-width:3px,color:#fff
    style S3 fill:#e74c3c,stroke:#c0392b,stroke-width:3px,color:#fff
    style Jobs fill:#f39c12,stroke:#e67e22,stroke-width:3px,color:#fff
    style Vault fill:#34495e,stroke:#2c3e50,stroke-width:3px,color:#fff
    style TG fill:#0088cc,stroke:#006bb3,stroke-width:3px,color:#fff
    style CFLint fill:#9b59b6,stroke:#8e44ad,stroke-width:2px,color:#fff
    style Client fill:#2c3e50,stroke:#34495e,stroke-width:2px,color:#fff
    style Users fill:#16a085,stroke:#138d75,stroke-width:2px,color:#fff
```

---

## Технологический стек

Под капотом — проверенные временем инструменты. Мы сознательно выбрали стек, который даёт типобезопасность, предсказуемую производительность и зрелые экосистемы.

- **Язык**: Go 1.24.4
- **API**: gRPC + gRPC-Gateway (dual gRPC/REST)
- **База данных**: PostgreSQL 15+ с pgx драйвером
- **Файловое хранилище**: MinIO (S3‑совместимое)
- **Аутентификация**: JWT с ролевой моделью доступа
- **Генерация кода**: Protocol Buffers + buf toolchain
- **Уведомления**: Telegram Bot API
- **Управление секретами**: HashiCorp Vault
- **Фоновые задачи**: go-co-op/gocron v2

---

## Архитектурные принципы

Чтобы не превращать систему в «комок зависимостей», мы опираемся на Hexagonal Architecture. Это позволяет сохранять чёткие границы между слоями, наращивать функциональность без каскада регрессий и безопасно эволюционировать API.

```
┌─ Interface Layer   ─┐  ┌─ Application Layer ─┐  ┌─ Domain Layer   ─┐  ┌─ Infrastructure  ─┐
│ • gRPC/HTTP         │  │ • Services          │  │ • Business Logic │  │ • PostgreSQL      │
│ • Protocol Buffers  │  │ • Use Cases         │  │ • Entities       │  │ • MinIO/S3        │
│ • REST Gateway      │  │ • Orchestration     │  │ • Value Objects  │  │ • Telegram API    │
└─────────────────────┘  └─────────────────────┘  └──────────────────┘  └───────────────────┘
```

**Ключевые архитектурные решения:**

- **Инверсия зависимостей (Dependency Inversion)**: Интерфейсы задают контракты, реализации инжектируются.
- **Принцип единственной ответственности (Single Responsibility)**: У компонента одна причина для изменения.
- **Разделение интерфейсов (Interface Segregation)**: Клиенты не зависят от лишних методов.
- **Fail‑fast**: Ошибки выявляются и сообщаются сразу.

---

## Архитектура Backend

### Структура проекта

Дерево репозитория отражает логические границы: приложение, домен, инфраструктура и адаптеры наружу.

```
cmd/
├── api/              # Главный API сервер
└── cronjobs/         # Фоновые процессы
    ├── telegram_bot/      # Telegram бот
    └── process_*/         # Аналитические процессы

internal/
├── app/              # Бизнес-логика приложения
│   ├── auth/             # Аутентификация и авторизация
│   ├── contract_diff/    # Анализ различий контрактов
│   ├── dumping_contracts/ # Обнаружение демпинга
│   └── unload_excel/     # Генерация Excel отчетов
├── service/          # Сервисный слой
├── repository/       # Слой доступа к данным
├── model/            # Доменные модели
│   ├── auth/             # Модели аутентификации
│   ├── contract/         # Модели контрактов
│   └── company/          # Модели компаний
├── adapter/          # Адаптеры внешних сервисов
│   ├── s3/               # MinIO/S3 интеграция
│   ├── telegram/         # Telegram Bot API
│   └── vault/            # HashiCorp Vault
├── pb/               # Генерируемые Protocol Buffer типы
├── middleware/       # HTTP/gRPC middleware
└── tools/            # Вспомогательные утилиты

api/                  # Protocol Buffer определения
migrations/           # Миграции базы данных
```

### Слои архитектуры (схема, backend)

Схема ниже показывает транспорты (gRPC/HTTP), слой оркестрации, доменные сервисы и то, как репозитории и адаптеры сходятся на инфраструктуре — PostgreSQL, MinIO/S3, Vault и Telegram API.

```mermaid
graph LR
    subgraph "🌐 Interface Layer"
        GRPC[🔌 gRPC Services]
        HTTP[🌍 HTTP Gateway]
        PB[📋 Protocol Buffers]
    end

    subgraph "⚙️ Application Layer"
        APP[🏗️ App Services]
        MW[🛡️ Middleware]
    end

    subgraph "💼 Business Layer"
        SVC[🔧 Service Layer]
        MDL[📊 Domain Models]
    end

    subgraph "💾 Data Layer"
        REPO[🗃️ Repository]
        ADAPT[🔗 Adapters]
    end

    subgraph "🏗️ Infrastructure"
        PG[🗄️ PostgreSQL]
        MINIO[📦 MinIO/S3]
        VLT[🔐 Vault]
        TG_API[🤖 Telegram API]
    end

    GRPC --> APP
    HTTP --> APP
    PB --> GRPC

    APP --> SVC
    MW --> SVC

    SVC --> REPO
    SVC --> MDL

    REPO --> PG
    ADAPT --> MINIO
    ADAPT --> VLT
    ADAPT --> TG_API

    style GRPC fill:#3498db,stroke:#2980b9,stroke-width:3px,color:#fff
    style HTTP fill:#27ae60,stroke:#229954,stroke-width:3px,color:#fff
    style PB fill:#f39c12,stroke:#e67e22,stroke-width:3px,color:#fff
    style APP fill:#9b59b6,stroke:#8e44ad,stroke-width:3px,color:#fff
    style MW fill:#e74c3c,stroke:#c0392b,stroke-width:3px,color:#fff
    style SVC fill:#16a085,stroke:#138d75,stroke-width:3px,color:#fff
    style MDL fill:#f39c12,stroke:#e67e22,stroke-width:3px,color:#fff
    style REPO fill:#8e44ad,stroke:#7d3c98,stroke-width:3px,color:#fff
    style ADAPT fill:#d35400,stroke:#ba4a00,stroke-width:3px,color:#fff
    style PG fill:#2c3e50,stroke:#34495e,stroke-width:3px,color:#fff
    style MINIO fill:#e67e22,stroke:#d35400,stroke-width:3px,color:#fff
    style VLT fill:#34495e,stroke:#2c3e50,stroke-width:3px,color:#fff
    style TG_API fill:#0088cc,stroke:#006bb3,stroke-width:3px,color:#fff
```

---

## API‑дизайн на базе Protocol Buffers

Контракт‑first подход — основа согласованности. Сначала мы описываем контракт в protobuf, а затем генерируем строго типизированный код и REST‑прокси через gRPC‑Gateway. Это минимизирует расхождения между командами и ускоряет разработку клиентов.

**Контракт‑design (contract‑first)**

```protobuf
service AuthService {
  rpc Login(LoginRequest) returns (LoginResponse) {
    option (google.api.http) = {
      post: "/v1/auth/login"
      body: "*"
    };
  }
}

message User {
  string username = 1 [(google.api.field_behavior) = REQUIRED];
  string name = 2 [(google.api.field_behavior) = REQUIRED];
  repeated shared.v1.UserRole roles = 3;
  repeated shared.v1.Region regions = 4;
}
```

**Преимущества подхода:**

- **Типобезопасность**: Автоматическая генерация строго типизированного кода.
- **Обратная совместимость**: Эволюция API без breaking‑changes.
- **Мультиязычность**: Один контракт для клиентов на разных языках.
- **Самодокументируемость**: Контракт служит спецификацией API.
- **Валидация по схеме**: Ограничения и аннотации на уровне protobuf.

---

## Фоновые процессы и задачи

Фоновая обработка — сердце аналитики: планировщик, идемпотентность, ретраи, единичность выполнения и корректное завершение.

**Архитектура cronjobs:**

```go
// Современный подход с go-co-op/gocron v2
scheduler := gocron.NewScheduler()

job := scheduler.NewJob(
    gocron.CronJob("0 */4 * * *", false), // Каждые 4 часа
    gocron.NewTask(processContracts),
    gocron.WithSingletonMode(gocron.LimitModeReschedule),
    gocron.WithEventListeners(
        gocron.AfterJobRuns(logJobCompletion),
        gocron.AfterJobRunsWithError(notifyError),
    ),
)
```

**Принципы фоновой обработки:**

- **Idempotency**: Повторные запуски безопасны.
- **Retry Logic**: Экспоненциальная задержка при ошибках.
- **Singleton Jobs**: Предотвращение параллельного выполнения.
- **Наблюдаемость**: Логирование и мониторинг всех операций.
- **Graceful Shutdown**: Корректное завершение при остановке.

---

## Интеграции и внешние сервисы

### Интеграция Telegram‑бота

Взаимодействие с пользователями идёт не только через веб — Telegram остаётся важным каналом уведомлений и быстрых команд.

**Архитектура бота:**

- **Polling Service**: Отдельный процесс для получения сообщений.
- **Command Handlers**: Обработка команд (/start, /connect, /help).
- **Account Linking**: Связывание через временные коды в Vault.
- **Notifications**: Уведомления о готовности выгрузок.

**Процесс связывания аккаунтов:**

```mermaid
sequenceDiagram
    participant User as 👤 Пользователь
    participant TG as 🤖 Telegram Bot
    participant API as 🚀 daca-api
    participant Vault as 🔐 HashiCorp Vault
    participant Web as 🌐 Web Interface

    User->>+TG: 📱 /connect
    TG->>+API: 🔑 Запрос на генерацию кода
    API->>API: 🎲 generateSecureCode(6)
    API->>+Vault: 💾 Сохранить код с TTL 5 мин
    Vault->>-API: ✅ OK
    API->>-TG: 📋 Возврат кода
    TG->>-User: 💬 "Ваш код: ABC123"

    User->>+Web: ⌨️ Ввод кода в веб-интерфейсе
    Web->>+API: 🔍 Валидация кода
    API->>+Vault: 📡 Получить данные по коду
    Vault->>-API: 📊 telegram_id + metadata
    API->>API: 🔗 Связывание аккаунтов
    API->>+Vault: 🗑️ Удалить использованный код
    Vault->>-API: ✅ Deleted
    API->>-Web: 🎉 Успешное связывание
    Web->>-User: 🎊 "Telegram подключен!"

    rect rgb(240, 248, 255)
        Note over Vault: ⏰ TTL автоматически<br/>🗑️ удаляет истекшие коды
    end
```

**Безопасность связывания аккаунтов:**

```go
// Генерация временного кода
code := generateSecureCode(6)
err := vaultClient.StoreWithTTL(ctx,
    fmt.Sprintf("telegram/codes/%s", code),
    map[string]interface{}{
        "telegram_id": telegramID,
        "username":    username,
    },
    5*time.Minute, // TTL 5 минут
)
```

### HashiCorp Vault

**Управление секретами:**

- **Временные коды**: Автоматическое истечение через TTL.
- **API ключи**: Централизованное хранение секретов.
- **Database Credentials**: Динамические базы данных.
- **Health Monitoring**: Мониторинг доступности Vault.

### Хранилище MinIO/S3

**Файловое хранилище:**

- **Excel Exports**: Генерация отчётов в фоне.
- **Presigned URLs**: Безопасная загрузка файлов.
- **Bucket Policies**: Управление доступом к файлам.
- **Lifecycle Management**: Автоматическая очистка старых файлов.

---

## Бизнес‑логика и аналитика

### Риск‑индикаторы

Система реализует комплексный анализ контрактов для выявления потенциальных нарушений и аномалий в сфере государственных закупок. Ниже — набор конкретных индикаторов, с формулами и условиями срабатывания.

#### 1. Сверхдемпинговые контракты

**Цель**: Выявление контрактов с аномально низкой стоимостью по сравнению с плановой суммой.

**Параметры**:

- **P** — плановая сумма контракта
- **C** — фактическая сумма контракта
- **T** — пороговый коэффициент демпинга

**Формула расчёта**:

```
Процент снижения = (P - C) × 100 / P
```

**Условие срабатывания**: Процент снижения превышает установленный порог.

#### 2. Контракты с минимальным демпингом

**Цель**: Выявление контрактов с незначительным, но подозрительно точным снижением цены.

**Логика**: Контракт почти равен плановой сумме, но с небольшим снижением — возможен предварительный сговор.

**Формула расчёта**:

```
Процент снижения = (P - C) × 100 / P
```

**Условие**: Фактическая сумма близка к плановой с небольшим отклонением в пределах установленного порога.

#### 3. Ускоренное согласование оплаты

**Цель**: Обнаружение подозрительно быстрых платежей после заключения контракта.

**Параметры**:

- **Dcontract** — дата создания контракта
- **Dpayment** — дата платежа

**Условие срабатывания**:

```
Dpayment - Dcontract < установленного_порога_дней
```

**Дополнительные фильтры**: Учитываются только годовые государственные контракты с определёнными статусами.

#### 4. Увеличение суммы контракта

**Цель**: Выявление контрактов с существенным увеличением суммы в процессе исполнения.

**Параметры**:

- **Sfirst** — сумма первоначального контракта
- **Slast** — сумма финального контракта
- **Ffirst** — фактическая сумма первого этапа
- **Flast** — фактическая сумма последнего этапа

**Формулы расчёта**:

```
Рост суммы = (Slast - Sfirst) × 100 / Sfirst
Рост факта = (Flast - Ffirst) × 100 / Ffirst
```

**Условие срабатывания**: Любой из показателей роста превышает установленный порог.

#### 5. Анализ партнёрства заказчик–поставщик

**Цель**: Выявление подозрительно тесных связей между заказчиками и поставщиками.

**Параметры**:

- **Npair** — количество контрактов в анализируемой паре
- **Nsupplier** — общее количество контрактов поставщика
- **Ncustomer** — общее количество контрактов заказчика

**Формулы расчёта**:

```
Доля поставщика = Npair / Nsupplier
Доля заказчика = Npair / Ncustomer
```

**Условия фильтрации**: Пара попадает в отчёт только если:

- Количество контрактов в паре превышает минимальный порог.
- Обе доли превышают установленные пороговые значения.

#### 6. Общие фильтры и ограничения

**Типы контрактов**: Анализируются только годовые и стандартные контракты.

**Требования к данным**:

- Обязательное наличие БИН заказчика и поставщика.
- Суммы контрактов должны быть больше нуля.
- Для большинства расчётов используются только корневые контракты.

**Статусы контрактов**: Учитываются контракты с определёнными статусами, исключающие черновики и отменённые контракты.

---

## Конвейер генерации Excel

Экспорт в Excel — востребованный формат для проверок и коммуникации с внешними стейкхолдерами. Важно, чтобы он был **асинхронным**, предсказуемым и устойчивым к сбоям.

**Архитектура генерации отчётов:**

1. **Обработка запроса**: Асинхронное принятие и постановка в очередь.
2. **Агрегация данных**: Сбор из нескольких источников.
3. **Генерация Excel**: Создание файла на базе excelize v2.
4. **Загрузка в S3**: Отправка в объектное хранилище.
5. **Уведомление в Telegram**: Сообщение пользователю о готовности.

```mermaid
sequenceDiagram
    participant User as 👤 Пользователь
    participant API as 🚀 daca-api
    participant Queue as 📋 Job Queue
    participant BG as ⚙️ Background Job
    participant DB as 🗄️ PostgreSQL
    participant S3 as 📦 MinIO/S3
    participant TG as 🤖 Telegram Bot

    User->>+API: 📊 Запрос на генерацию Excel
    API->>+Queue: ➕ Добавить задачу в очередь
    API->>-User: ✅ 202 Accepted (async)

    Queue->>+BG: 🔄 Выполнить задачу
    BG->>+DB: 📡 Получить данные
    DB->>-BG: 📈 Возврат данных

    BG->>BG: 📝 Генерация Excel файла
    BG->>+S3: ⬆️ Загрузка файла
    S3->>-BG: ✅ Подтверждение загрузки

    BG->>+TG: 📤 Отправка уведомления
    TG->>-User: 📱 Telegram уведомление с ссылкой

    rect rgb(255, 243, 224)
        Note over BG: ⚠️ Обработка ошибок:<br/>🔄 Retry с экспоненциальной задержкой<br/>📢 Telegram уведомления об ошибках
    end
```

```go
// Пример архитектуры обработки
type ExcelProcessor struct {
    repo      Repository
    storage   S3Client
    telegram  TelegramClient
    templates ExcelTemplates
}

func (p *ExcelProcessor) ProcessRequest(ctx context.Context, req ExportRequest) error {
    // 1. Валидация запроса
    // 2. Извлечение данных
    // 3. Генерация Excel
    // 4. Загрузка в S3
    // 5. Отправка уведомления
}
```

---

## DevOps и развертывание

Нам нужен был бесшовный путь от коммита до деплоя на self‑hosted сервере в Казахстане. CI/CD на GitHub Actions решает эту задачу: валидирует код, публикует образы в GHCR и запускает автоматический деплой.

### CI/CD Pipeline

**GitHub Actions Workflows:**

```yaml
# CI Pipeline - основной поток
name: CI Pipeline
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  validate: # Линтинг и проверки качества
  publish: # Сборка и публикация Docker образов
  deploy: # Автоматическое развертывание
```

**Workflow файлы:**

- **ci-pipeline.yaml**: Основной CI/CD поток.
- **auto-deploy.yaml**: Развертывание на self-hosted runner.
- **lint.yaml**: Комплексные проверки (Go, protobuf, SQL).
- **publish.yaml**: Сборка и публикация образов.

### CI/CD Flow

```mermaid
flowchart TD
    A[📝 git push to main] --> B[🚀 GitHub Actions Trigger]
    B --> C{🔄 CI Pipeline}

    C --> D[✅ validate Job]
    C --> E[📦 publish Job]

    D --> F[🧹 Go Linting]
    D --> G[📋 Protobuf Validation]
    D --> H[🗄️ SQL Migration Check]

    E --> I[🐳 Build Docker Image]
    E --> J[⬆️ Push to GHCR]

    F --> K{🤔 All Checks Pass?}
    G --> K
    H --> K
    I --> K
    J --> K

    K -->|✅ Yes| L[🚀 deploy Job]
    K -->|❌ No| M[💥 Pipeline Failed]

    L --> N[🖥️ Self-Hosted Runner KZ]
    N --> O[⬇️ Git Pull Latest]
    N --> P[🔑 Docker Login GHCR]
    N --> Q[⚙️ make deploy]

    Q --> R[🐳 Docker Compose Up]
    R --> S[🔍 Verify Containers]
    S --> T[🎉 Deployment Success]

    style A fill:#3498db,stroke:#2980b9,stroke-width:3px,color:#fff
    style T fill:#27ae60,stroke:#229954,stroke-width:3px,color:#fff
    style M fill:#e74c3c,stroke:#c0392b,stroke-width:3px,color:#fff
    style K fill:#f39c12,stroke:#e67e22,stroke-width:3px,color:#fff
    style N fill:#9b59b6,stroke:#8e44ad,stroke-width:3px,color:#fff
    style D fill:#16a085,stroke:#138d75,stroke-width:2px,color:#fff
    style E fill:#8e44ad,stroke:#7d3c98,stroke-width:2px,color:#fff
    style F fill:#27ae60,stroke:#229954,stroke-width:2px,color:#fff
    style G fill:#e67e22,stroke:#d35400,stroke-width:2px,color:#fff
    style H fill:#34495e,stroke:#2c3e50,stroke-width:2px,color:#fff
    style I fill:#3498db,stroke:#2980b9,stroke-width:2px,color:#fff
    style J fill:#e74c3c,stroke:#c0392b,stroke-width:2px,color:#fff
```

### Deployment Strategy

**Гибридная инфраструктура с Cloudflare** — способ совместить географическую близость и глобальную доступность.

**Cloudflare Edge Layer:**

- **CDN и защита**: Глобальная сеть Cloudflare для кеширования и DDoS‑защиты.
- **Load Balancer**: Встроенный балансировщик нагрузки с health checks.
- **SSL Termination**: Автоматические SSL‑сертификаты и TLS‑шифрование.
- **Geographic Routing**: Оптимизация маршрутизации для пользователей из СНГ.

**Cloudflare Warp Integration:**

```mermaid
graph LR
    Internet[🌐 Интернет] --> CF[☁️ Cloudflare Edge]
    CF --> Warp[🔒 Cloudflare Warp Tunnel]

    subgraph "🛡️ Cloudflare Services"
        CF
        CDN[📦 CDN Cache]
        WAF[🛡️ Web Application Firewall]
        LB[⚖️ Load Balancer]
        CF --> CDN
        CF --> WAF
        CF --> LB
        LB --> Warp
    end

    Warp -.->|🔐 Encrypted Tunnel| Server[🖥️ Сервер в Казахстане]
    Server --> Docker[🐳 Docker Compose Stack]

    style CF fill:#f39c12,stroke:#e67e22,stroke-width:3px,color:#fff
    style Warp fill:#e67e22,stroke:#d35400,stroke-width:3px,color:#fff
    style Server fill:#27ae60,stroke:#229954,stroke-width:3px,color:#fff
    style CDN fill:#3498db,stroke:#2980b9,stroke-width:2px,color:#fff
    style WAF fill:#e74c3c,stroke:#c0392b,stroke-width:2px,color:#fff
    style LB fill:#9b59b6,stroke:#8e44ad,stroke-width:2px,color:#fff
    style Docker fill:#0073ec,stroke:#005cbf,stroke-width:3px,color:#fff
```

**Решение проблемы серого IP:**

- **Cloudflare Warp Tunnel**: Безопасный туннель между Edge и origin‑сервером.
- **Zero Trust Architecture**: Нет необходимости в белом IP‑адресе.
- **Automatic Failover**: Автоматическое переключение при сбоях.
- **End‑to‑End Encryption**: Шифрование трафика от клиента до сервера.

**Self‑Hosted Infrastructure (Казахстан):**

- **Location**: Астана, Казахстан — близость к основной аудитории.
- **Network**: Серый IP с Warp tunnel для публичного доступа.
- **Self‑hosted runner**: GitHub Actions runner для автоматизации.
- **Docker Compose**: Управление контейнерами через compose‑файлы.
- **Multi‑stage deployment**: Раздельные файлы для apps, databases, swagger.

**Deployment Process:**

```bash
# Основной процесс развертывания
1. Git pull latest code
2. Docker login to GitHub Container Registry
3. make deploy - запуск через Makefile
4. Verification - проверка running containers
```

**Docker Compose Architecture:**

```yaml
# docker-compose.apps.yaml - основные сервисы
# docker-compose.databases.yaml - базы данных
# docker-compose.swagger.yaml - документация API
```

---

## Наблюдаемость

Надёжная аналитика невозможна без наблюдаемости. Структурированные логи, health‑checks и метрики — встроенная часть платформы.

**Мониторинг и логирование:**

- **Structured Logging**: Структурированные логи с контекстом.
- **Health Checks**: Проверки состояния всех компонентов.
- **Performance Metrics**: Метрики производительности.
- **Error Tracking**: Отслеживание и уведомления об ошибках.

```go
// Пример структурированного логирования
logger.Info(ctx, "Processing export request",
    logger.WithString("export_type", exportType),
    logger.WithInt("user_id", userID),
    logger.WithString("request_id", requestID),
)
```

---

## Масштабируемость и производительность

Мы проектировали PostgreSQL таблицы под аналитические нагрузки, а приложение — под устойчивые пики.

### Проектирование базы данных

**PostgreSQL оптимизация:**

- **Индексирование**: Составные индексы для аналитических запросов.
- **Connection Pooling**: Пул соединений с pgx.
- **Query Optimization**: Анализ и оптимизация медленных запросов.

### Стратегия кэширования

**Многоуровневое кэширование:**

- **Application Cache**: In‑memory кэш в приложении.
- **Database Cache**: Кэширование результатов запросов.

### Асинхронная обработка

**Фоновая обработка:**

- **Job Queues**: Очереди задач для тяжёлых операций.
- **Batch Processing**: Пакетная обработка больших объёмов данных.
- **Stream Processing**: Потоковая обработка в реальном времени.
- **Rate Limiting**: Ограничение нагрузки на внешние API.

---

## Безопасность

### Аутентификация и авторизация

**Многоуровневая безопасность:**

- **JWT Tokens**: Stateless аутентификация с коротким TTL.
- **Role‑Based Access**: Ролевая модель с региональными ограничениями.
- **Token Refresh**: Обновление токенов без повторной аутентификации.
- **Session Management**: Управление сессиями пользователей.

### Защита данных

**Защита данных:**

- **Input Validation**: Валидация на всех уровнях.
- **SQL Injection Prevention**: Параметризованные запросы.
- **XSS Protection**: Санитизация пользовательского ввода.
- **CORS Configuration**: Настройка политик CORS.

### Безопасность инфраструктуры

**Безопасность инфраструктуры:**

- **Secrets Management**: Централизованное управление через Vault.
- **Network Security**: Изоляция сервисов через Docker networks.
- **SSL/TLS**: Шифрование всех соединений.
- **Regular Updates**: Регулярные обновления зависимостей.

---

## Выводы

Архитектура DACA представляет собой современный подход к построению enterprise‑приложений с акцентом на практическую ценность, сопровождаемость и предсказуемость.

**Качество архитектуры:**

- Clean Architecture для сопровождаемости.
- Типобезопасность на всех уровнях.
- Contract‑first дизайн API.
- Комплексная стратегия тестирования.

**Developer Experience:**

- Автоматическая генерация кода.
- Горячая перезагрузка в разработке.
- Полная документация.
- Современные инструменты.

**Operational Excellence:**

- Полный мониторинг.
- Автоматизированное тестирование.
- План восстановления после сбоев.

---

## Технические детали

Полная документация API доступна через Swagger UI, исходный код следует принципам Clean Code, а развертывание автоматизировано через CI/CD пайплайны. Система успешно обрабатывает **миллионы записей** контрактов и обеспечивает аналитические инсайты для принятия решений в сфере государственных закупок.

Полная документация API доступна через Swagger UI, исходный код следует принципам Clean Code, а развертывание автоматизировано через CI/CD пайплайны. Система успешно обрабатывает **миллионы записей** контрактов и обеспечивает аналитические инсайты для принятия решений в сфере государственных закупок.
