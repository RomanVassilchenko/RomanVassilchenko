// Localization strings for resume
// Usage: #t("key") returns the translated string for current language

#let translations = (
  en: (
    // Header
    job-title: "Go Backend Developer",

    // Section titles
    key-skills: "Key Skills",
    work-experience: "Work Experience",
    education: "Education",
    additional: "Additional",
    languages: "Languages",
    key-projects: "Key Projects",

    // Labels
    tech-stack: "Tech Stack",
    present: "Present",

    // Summary
    summary: "Go backend engineer with hands-on experience building high-load distributed systems. I design and develop microservices that process millions of requests using event-driven architecture with Kafka, PostgreSQL optimization, and gRPC/REST APIs. At Bereke Bank, I worked on launching a collateral-backed auto loan platform and now build a unified credit pipeline from scratch. Creator of AdalQarau, a public procurement analytics platform with anomaly detection algorithms.",

    // Skills
    skills-text: "Go, gRPC, REST/HTTP, PostgreSQL, Redis, Kafka, Docker, Camunda BPMN, MongoDB, Neo4j, Protocol Buffers, MinIO/S3, GitHub Actions, AWS, Kubernetes, testify, NixOS, Python.",

    // Experience - Bereke Bank
    bereke-title: "Middle Backend Go Developer",
    bereke-company: "Bereke Bank",
    bereke-date: "Sep 2025 — Present",
    bereke-subtitle: "Auto Loan + Credit Pipeline Teams · production; microservices; event-driven",
    bereke-item-1: "Worked on launching the collateral-backed auto loan system via Camunda BPMN process orchestration.",
    bereke-item-2: "Implemented integrations with government services: collateral verification, credit history, identity checks.",
    bereke-item-3: "Created Mattermost integration for real-time alerts on banking operations.",
    bereke-item-4: "Transitioned to Credit Pipeline team: designing unified credit conveyor from scratch with high-load architecture.",
    bereke-item-5: "Laying architectural patterns and integrations with core banking systems and external data sources.",
    bereke-stack: "Go, PostgreSQL, Redis, Kafka, Camunda BPMN, Docker, GraphQL, REST, CI/CD",

    // Experience - Ozon Junior
    ozon-jr-title: "Junior Backend Go Developer",
    ozon-jr-company: "Ozon Tech",
    ozon-jr-date: "Aug 2024 — Sep 2025",
    ozon-jr-subtitle: "Enterprise Employee Portal (60,000+ users) · production; monolith → microservices",
    ozon-jr-item-1: "Led monolith decomposition: extracted employee data into standalone service, reducing core load by 20–25%.",
    ozon-jr-item-2: "Developed staff-lib — reusable library for DB access, validation, and middleware — adopted across dozens of services.",
    ozon-jr-item-3: "Automated attendance enforcement: reclaiming unused seats and blocking repeat no-shows.",
    ozon-jr-item-4: "Built data export pipeline from Ozon Forms to Vertica for analytics teams.",
    ozon-jr-item-5: "Built document generation systems and configurable templating engines for corporate reporting.",
    ozon-jr-item-6: "Implemented video preview generation and backend optimizations for large file processing in Ozon Disk.",
    ozon-jr-stack: "Go, gRPC, PostgreSQL, ClickHouse, Redis, Kafka, Vertica, Prometheus, Grafana",

    // Experience - Ozon Intern
    ozon-intern-title: "Backend Developer Intern",
    ozon-intern-company: "Ozon Tech",
    ozon-intern-date: "Dec 2023 — Aug 2024",
    ozon-intern-subtitle: "Ozon Matrix Platform (Company-wide Hiring System) · production; microservices; high traffic",
    ozon-intern-item-1: "Optimized complex SQL queries, accelerating candidate list generation by up to 8×.",
    ozon-intern-item-2: "Re-engineered ElasticSearch filter logic — improved speed 2.5× and reduced cluster load.",
    ozon-intern-item-3: "Integrated Chatzone (Mattermost) via dedicated gRPC notification service with sharding and delayed Kafka dispatch — cut manager response time to applications.",
    ozon-intern-item-4: "Designed Grafana dashboards for proactive error monitoring — boosted anomaly detection and response speed.",
    ozon-intern-stack: "Go, PostgreSQL, Redis, ElasticSearch, Kafka, ClickHouse, gRPC, REST, Grafana",

    // Education
    edu-masters-title: "M.Sc. in Computer Science & Engineering",
    edu-masters-school: "Astana IT University (AITU), Astana",
    edu-masters-date: "2025 — Present",
    edu-masters-item: "Thesis: Intelligent Methods for Analyzing and Detecting Anomalies in Tender Procurement Data.",

    edu-bachelors-title: "B.Sc. in Software Engineering",
    edu-bachelors-school: "Astana IT University (AITU), Astana",
    edu-bachelors-date: "2023 — 2025",
    edu-bachelors-item: "Relevant Coursework: Graph Theory Methods in Information Systems (Neo4j + GDS), Advanced Database Systems (PostgreSQL optimization), NoSQL Systems (MongoDB + FastAPI).",

    edu-prev-title: "Previous Studies",
    edu-prev-school: "ITMO University, St. Petersburg",
    edu-prev-date: "2021 — 2023",
    edu-prev-item: "2 years completed before transfer to AITU for Software Engineering.",

    // Additional
    additional-item-1: "Full-time availability (on-site / hybrid / remote).",
    additional-item-2: "Open to international relocation (Netherlands, Denmark, Cyprus, etc.).",
    additional-item-3: "Seeking challenging backend engineering roles with growth opportunities.",

    // Languages
    lang-russian: "Russian — Native",
    lang-english: "English — C1 (Professional working proficiency)",
    lang-kazakh: "Kazakh — Basic",

    // Projects
    project-title: "Creator",
    project-name: "AdalQarau — Public Procurement Analytics Platform",
    project-date: "2024 — Present",
    project-item-1: "Designed and built risk scoring system with graph-based relationship analysis between procurement participants.",
    project-item-2: "Scalable Go backend: data processing pipelines, risk indicators, automated report generation.",
    project-stack: "Go, PostgreSQL, Kafka, REST API, Data Pipelines",
  ),

  ru: (
    // Header
    job-title: "Go Backend Разработчик",

    // Section titles
    key-skills: "Ключевые навыки",
    work-experience: "Опыт работы",
    education: "Образование",
    additional: "Дополнительно",
    languages: "Языки",
    key-projects: "Ключевые проекты",

    // Labels
    tech-stack: "Стек",
    present: "Наст. время",

    // Summary
    summary: "Go backend-инженер с опытом высоконагруженных распределённых систем. Строю микросервисы на событийной архитектуре с Kafka, оптимизирую PostgreSQL, проектирую gRPC/REST API. В Bereke Bank работал над запуском платформы автокредитования под залог, сейчас строю единый кредитный конвеер с нуля. Автор AdalQarau — платформы аналитики госзакупок с алгоритмами обнаружения аномалий.",

    // Skills
    skills-text: "Go, gRPC, REST/HTTP, PostgreSQL, Redis, Kafka, Docker, Camunda BPMN, MongoDB, Neo4j, Protocol Buffers, MinIO/S3, GitHub Actions, AWS, Kubernetes, testify, NixOS, Python.",

    // Experience - Bereke Bank
    bereke-title: "Middle Go Backend разработчик",
    bereke-company: "Bereke Bank",
    bereke-date: "Сен 2025 — Наст. время",
    bereke-subtitle: "Команда автокредитования → Единый кредитный конвеер · production; микросервисы; event-driven",
    bereke-item-1: "Работал над запуском системы автокредитования под залог с BPMN-оркестрацией через Camunda.",
    bereke-item-2: "Реализовал интеграции с государственными сервисами: проверка залога, кредитная история, идентификация личности.",
    bereke-item-3: "Создал интеграцию с Mattermost для алертов по банковским операциям в реальном времени.",
    bereke-item-4: "Перешёл в команду кредитного конвеера: проектирую единый кредитный конвеер с нуля (high-load архитектура).",
    bereke-item-5: "Закладываю архитектурные паттерны и интеграции с банковскими системами и внешними источниками данных.",
    bereke-stack: "Go, PostgreSQL, Redis, Kafka, Camunda BPMN, Docker, GraphQL, REST, CI/CD",

    // Experience - Ozon Junior
    ozon-jr-title: "Junior Go Backend разработчик",
    ozon-jr-company: "Ozon Tech",
    ozon-jr-date: "Авг 2024 — Сен 2025",
    ozon-jr-subtitle: "Корпоративный портал сотрудников (60 000+ пользователей) · production; монолит → микросервисы",
    ozon-jr-item-1: "Провёл декомпозицию монолита: вынес данные сотрудников в отдельный сервис, снизив нагрузку на ядро на 20–25%.",
    ozon-jr-item-2: "Разработал staff-lib - переиспользуемую библиотеку для работы с БД, валидации и middleware; её внедрили в десятках сервисов.",
    ozon-jr-item-3: "Автоматизировал контроль посещаемости: освобождение неиспользуемых мест и блокировка повторных неявок.",
    ozon-jr-item-4: "Реализовал конвейер экспорта данных из Ozon Forms в Vertica для аналитических команд.",
    ozon-jr-item-5: "Создал системы генерации документов и настраиваемые шаблонизаторы для корпоративной отчётности.",
    ozon-jr-item-6: "Реализовал генерацию превью видео и бэкенд-оптимизации для обработки больших файлов в Ozon Disk.",
    ozon-jr-stack: "Go, gRPC, PostgreSQL, ClickHouse, Redis, Kafka, Vertica, Prometheus, Grafana",

    // Experience - Ozon Intern
    ozon-intern-title: "Стажёр Go Backend разработчик",
    ozon-intern-company: "Ozon Tech",
    ozon-intern-date: "Дек 2023 — Авг 2024",
    ozon-intern-subtitle: "Ozon Matrix Platform (корпоративная система найма) · production; микросервисы; высокая нагрузка",
    ozon-intern-item-1: "Оптимизировал сложные SQL-запросы, ускорив генерацию списков кандидатов до 8×.",
    ozon-intern-item-2: "Переработал логику фильтров ElasticSearch — улучшил скорость в 2.5× и снизил нагрузку на кластер.",
    ozon-intern-item-3: "Интегрировал Chatzone (Mattermost) через выделенный gRPC-сервис уведомлений с шардированием и отложенной отправкой через Kafka — сократил время ответа менеджеров на заявки.",
    ozon-intern-item-4: "Спроектировал Grafana-дашборды для проактивного мониторинга ошибок — повысил скорость обнаружения и реагирования на аномалии.",
    ozon-intern-stack: "Go, PostgreSQL, Redis, ElasticSearch, Kafka, ClickHouse, gRPC, REST, Grafana",

    // Education
    edu-masters-title: "Магистратура, Computer Science & Engineering",
    edu-masters-school: "Astana IT University (AITU), Астана",
    edu-masters-date: "2025 — Наст. время",
    edu-masters-item: "Тема: Интеллектуальные методы анализа и обнаружения аномалий в данных тендерных закупок.",

    edu-bachelors-title: "Бакалавриат, Software Engineering",
    edu-bachelors-school: "Astana IT University (AITU), Астана",
    edu-bachelors-date: "2023 — 2025",
    edu-bachelors-item: "Ключевые курсы: Методы теории графов в информационных системах (Neo4j + GDS), Продвинутые системы баз данных (оптимизация PostgreSQL), NoSQL-системы (MongoDB + FastAPI).",

    edu-prev-title: "Предыдущее обучение",
    edu-prev-school: "Университет ИТМО, Санкт-Петербург",
    edu-prev-date: "2021 — 2023",
    edu-prev-item: "2 года обучения до перевода в AITU на программу Software Engineering.",

    // Additional
    additional-item-1: "Полная занятость (офис / гибрид / удалённо).",
    additional-item-2: "Открыт к релокации (Нидерланды, Дания, Кипр и др.).",
    additional-item-3: "Рассматриваю сильные backend-позиции с возможностями профессионального роста.",

    // Languages
    lang-russian: "Русский — Родной",
    lang-english: "Английский — C1 (Профессиональный уровень)",
    lang-kazakh: "Казахский — Базовый",

    // Projects
    project-title: "Создатель",
    project-name: "AdalQarau — Аналитическая платформа госзакупок",
    project-date: "2024 — Наст. время",
    project-item-1: "Спроектировал и реализовал систему скоринга рисков с графовым анализом связей между участниками закупок.",
    project-item-2: "Масштабируемый Go-бэкенд: конвейеры обработки данных, индикаторы риска, автоматическая генерация отчётов.",
    project-stack: "Go, PostgreSQL, Kafka, REST API, Data Pipelines",
  ),
)

// Helper function to get translation
#let t(key, lang: "en") = {
  translations.at(lang).at(key, default: key)
}
