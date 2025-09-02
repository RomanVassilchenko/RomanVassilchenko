<!-- ---
title: "📄 Резюме"
description: "Роман Васильченко — Go Backend Engineer, опыт работы в Ozon, микросервисы и высокие нагрузки"
ShowToc: true
TocOpen: true
---

## 👨‍💻 Основная информация

| | |
|---|---|
| **ФИО** | Роман Васильченко |
| **Возраст** | 21 год |
| **Локация** | 📍 Астана, Казахстан |
| **Позиция** | Go Backend Engineer |
| **Опыт** | 1+ лет в Ozon + pet-проекты |
| **Языки** | 🇷🇺 Русский (родной), 🇬🇧 Английский (B2) |

## 🎯 Ключевые компетенции

### 🚀 **Backend Development**
- **Go** — основной язык, микросервисы, параллельность
- **Python** — скрипты автоматизации, интеграции
- **gRPC/REST/GraphQL** — проектирование и оптимизация API
- **Микросервисная архитектура** — декомпозиция монолитов

### 🗄️ **Базы данных и хранилища**
- **PostgreSQL** — оптимизация запросов, индексы, партиционирование
- **Redis** — кеширование, сессии, очереди
- **ClickHouse** — аналитические запросы, OLAP
- **ElasticSearch** — полнотекстовый поиск, аггрегации
- **MinIO/S3** — объектное хранилище

### 📊 **Observability & DevOps**
- **Prometheus** — сбор метрик, настройка алертов
- **Grafana** — дашборды, визуализация данных  
- **Loki** — централизованное логирование
- **Docker** — контейнеризация приложений
- **GitHub Actions** — CI/CD пайплайны

### 🔗 **Интеграции и сообщения**
- **Kafka** — асинхронная обработка сообщений
- **gRPC** — высокопроизводительное межсервисное взаимодействие
- **ProtoBuf** — эффективная сериализация данных

---

## 💼 Опыт работы

### 🏢 **Ozon — Go Backend Engineer** 
*Март 2023 – настоящее время (1 год 10 месяцев)*

Работаю в команде внутренних продуктов над HR-системами и инструментами для сотрудников компании.

#### 📊 **HR-платформа «Матрица»**

**Проблема:** Медленные SQL-запросы и поиск тормозили работу HR-специалистов  
**Решение:** Комплексная оптимизация производительности

**Результаты:**
- ⚡ **8× ускорение SQL-запросов** — переписал критические запросы, добавил индексы
- 🔍 **2.5× ускорение поиска** — оптимизировал ElasticSearch запросы и аггрегации
- 💬 **Интеграция с Chatzone** — разработал gRPC-сервис для связи с корпоративным чатом
- 📈 **Мониторинг** — настроил Grafana дашборды для отслеживания производительности

**Технологии:** Go, PostgreSQL, ElasticSearch, gRPC, Kafka, Grafana, Prometheus

#### 🏗️ **Внутренний портал Staff Portal**

**Проблема:** Монолитная архитектура замедляла разработку и масштабирование  
**Решение:** Декомпозиция монолита и создание переиспользуемых компонентов

**Результаты:**
- 🔧 **Разработал микросервис сотрудников** — выделил из монолита, снизил нагрузку на 20-25%
- 📚 **Создал staff-lib** — общую библиотеку (валидация, middleware, обработка ошибок)
- 📖 **Использование библиотеки** — внедрили в десятки микросервисов команды
- 🚫 **Система блокировки** — автоматическая блокировка "прогульщиков"
- 📊 **Интеграция с Vertica** — экспорт данных из Ozon Forms для аналитики

**Технологии:** Go, PostgreSQL, Redis, Vertica, gRPC, Docker

---

## 🚀 Pet-проекты

### 📊 **DACA / AdalQarau — Платформа аналитики госзакупок**
*Октябрь 2024 – настоящее время*

**Описание:** Система для анализа государственных закупок и выявления коррупционных рисков

**Ключевые особенности:**
- 🕸️ **Граф связей** — анализ отношений между участниками тендеров
- ⚠️ **Риск-индикаторы** — автоматическое выявление подозрительных паттернов
- 📈 **Аналитика** — статистика по закупкам, тенденции, аномалии
- 📊 **Excel-экспорт** — выгрузка данных для дальнейшего анализа
- 🔍 **GraphQL API** — гибкие запросы для фронтенда

**Архитектура:**
- Микросервисная архитектура с PostgreSQL
- MinIO для хранения файлов и документов
- Buf для управления ProtoBuf схемами
- Docker Compose для локальной разработки

**Impact:** Используется правоохранительными органами Республики Казахстан

**Технологии:** Go, PostgreSQL, MinIO, GraphQL, ProtoBuf, Buf, Docker

---

## 🎓 Образование

### **Astana IT University (AITU)**
*2023 – 2025 (ожидается)*  
**Специальность:** Software Engineering (Бакалавриат)

### **Университет ИТМО**  
*2021 – 2023*  
**Специальность:** Software Engineering (перевелся в Астану)

---

## 🛠️ Технический стек

### **Языки программирования**
![Go](https://img.shields.io/badge/-Go-00ADD8?style=flat&logo=go&logoColor=white)
![Python](https://img.shields.io/badge/-Python-3776AB?style=flat&logo=python&logoColor=white)

### **Базы данных**
![PostgreSQL](https://img.shields.io/badge/-PostgreSQL-336791?style=flat&logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/-Redis-DC382D?style=flat&logo=redis&logoColor=white)
![ClickHouse](https://img.shields.io/badge/-ClickHouse-FFCC01?style=flat&logo=clickhouse&logoColor=white)
![ElasticSearch](https://img.shields.io/badge/-ElasticSearch-005571?style=flat&logo=elasticsearch&logoColor=white)

### **Сообщения и интеграции**
![Apache Kafka](https://img.shields.io/badge/-Apache%20Kafka-000000?style=flat&logo=apachekafka&logoColor=white)
![gRPC](https://img.shields.io/badge/-gRPC-4285F4?style=flat&logo=google&logoColor=white)
![GraphQL](https://img.shields.io/badge/-GraphQL-E10098?style=flat&logo=graphql&logoColor=white)

### **DevOps и мониторинг**
![Docker](https://img.shields.io/badge/-Docker-2496ED?style=flat&logo=docker&logoColor=white)
![Prometheus](https://img.shields.io/badge/-Prometheus-E6522C?style=flat&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/-Grafana-F46800?style=flat&logo=grafana&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/-GitHub%20Actions-2088FF?style=flat&logo=githubactions&logoColor=white)

---

## 📞 Контакты

**Готов к рассмотрению предложений:** офис / гибрид / удаленка  
**Интересуют:** продуктовые команды с техническими вызовами, высокие нагрузки

[![Email](https://img.shields.io/badge/Email-roman.vassilchenko.work%40gmail.com-red?style=for-the-badge&logo=gmail&logoColor=white)](mailto:roman.vassilchenko.work@gmail.com)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-rovassilchenko-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rovassilchenko/)

[![GitHub](https://img.shields.io/badge/GitHub-RomanVassilchenko-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/RomanVassilchenko)

[![Telegram](https://img.shields.io/badge/Telegram-Roman__Vassilchenko-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/Roman_Vassilchenko)

**📞 Телефон:** +7 775 900-46-26
 -->
