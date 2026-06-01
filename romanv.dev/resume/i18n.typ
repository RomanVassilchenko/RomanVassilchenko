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

    // Tagline
    tagline: "Go developer building high-load financial systems. Ex-Ozon · Bereke Bank.",

    // Summary
    summary: "Go backend engineer specializing in high-load distributed systems and financial infrastructure. At Bereke Bank I design and build a unified credit pipeline, government data integrations, and fault-tolerant microservices for real-time credit decisioning. Previously at Ozon Tech, contributed to production systems serving 60000+ users. Creator of AdalQarau, a public procurement analytics platform with corruption risk detection.",

    // Skills
    skills-text: "Go, gRPC, REST/HTTP, PostgreSQL, Redis, Kafka, Docker, Camunda BPMN, MongoDB, Neo4j, Protocol Buffers, MinIO/S3, GitHub Actions, AWS, Kubernetes, testify, NixOS, Python.",

    // Experience - Bereke Bank
    bereke-title: "Middle Golang Developer",
    bereke-company: "Bereke Bank",
    bereke-date: "Sep 2025 — Present",
    bereke-subtitle: "Auto Loan Issuance Team / Unified Credit Pipeline Team · production; high-load; event-driven; microservices",
    bereke-item-1: "Architect and build the company's *unified credit pipeline*, standardizing loan issuance across products and centralizing application routing and validation.",
    bereke-item-2: "Built numerous *production integrations* with government and financial services, including First Credit Bureau (FCB), collateral registries, and identity verification.",
    bereke-item-3: "Designed fault-tolerant microservice architecture with strict *latency SLA* and event-driven communication via Kafka.",
    bereke-item-4: "Previously: supported the launch of a large *auto-loan credit pipeline* from pilot to production scale — parallelized processing, *reduced loan issuance time from 40 to 15 minutes*, and grew volume from zero to *130 applications per day within six months*; built a corporate messenger alerting library.",
    bereke-item-5: "",
    bereke-stack: "Go, PostgreSQL, Redis, Kafka, Camunda BPMN, Docker, GraphQL, REST, CI/CD",

    // Experience - Ozon Junior
    ozon-jr-title: "Junior Golang Developer",
    ozon-jr-company: "Ozon Tech",
    ozon-jr-date: "Aug 2024 — Sep 2025",
    ozon-jr-subtitle: "Enterprise Employee Portal (10000-15000 DAU / 40000+ MAU) · production; monolith → microservices",
    ozon-jr-item-1: "Contributed to the design and decomposition of a large employee-portal monolith into microservices; optimized core load by 20–25% within my domain.",
    ozon-jr-item-2: "Built *staff-lib* — internal Go SDK for DB access patterns, validation, and middleware — adopted as the standard across 30+ services.",
    ozon-jr-item-3: "Developed automated *attendance management system* with intelligent seat reclamation and enforcement logic across 60000+ employees; platform sustained *2000 concurrent users* during Staff 2.0 launch peaks.",
    ozon-jr-item-4: "Engineered an *ETL pipeline* from internal survey platform to Vertica, enabling self-service analytics for cross-functional teams.",
    ozon-jr-item-5: "Designed *document generation infrastructure* with configurable templating engine for enterprise-wide corporate reporting.",
    ozon-jr-item-6: "Delivered *video preview generation* service and backend optimizations for large-file processing in internal cloud storage service, including video assets up to *several TB per file*.",
    ozon-jr-stack: "Go, gRPC, PostgreSQL, ClickHouse, Redis, Kafka, Vertica, Prometheus, Grafana",

    // Experience - Ozon Intern
    ozon-intern-title: "Intern/Junior Golang Developer",
    ozon-intern-company: "Ozon Tech",
    ozon-intern-date: "Dec 2023 — Aug 2024",
    ozon-intern-subtitle: "Ozon Matrix (Company-wide Hiring Platform) · production; microservices; high traffic",
    ozon-intern-item-1: "Eliminated critical query bottlenecks in the hiring platform's candidate ranking — *significant speedup* on production SQL under peak load.",
    ozon-intern-item-2: "Redesigned *ElasticSearch filter execution*: 2.5× throughput improvement and significant cluster load reduction through query restructuring.",
    ozon-intern-item-3: "Designed and built a *gRPC notification microservice* for corporate messenger (Mattermost) with Kafka-based request sharding and configurable delayed dispatch — cut manager response time to candidate applications.",
    ozon-intern-item-4: "Built *Grafana observability layer* for the hiring platform — proactive anomaly detection dashboards that reduced incident response time.",
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
    project-item-1: "Built *rule-based corruption risk detection* across 14.47 million contracts, 197 thousand buyers and 800 thousand suppliers using 8 indicator algorithms operating without labeled training data.",
    project-item-2: "",
    project-item-3: "System produced 448 thousand risk flags across all 20 regions of Kazakhstan; thresholds calibrated with government auditors; outputs used in real audit workflows by regional Accounts Committee offices.",
    project-stack: "Go, ConnectRPC, PostgreSQL, React, TypeScript, MinIO/S3, Docker, Protobuf",
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

    // Tagline
    tagline: "Go разработчик высоконагруженных финансовых систем. Ex-Ozon · Bereke Bank.",

    // Summary
    summary: "Go backend-инженер, специализирующийся на высоконагруженных распределённых системах и финансовой инфраструктуре. В Bereke Bank проектирую и разрабатываю единый кредитный конвейер, государственные интеграции и отказоустойчивые микросервисы для принятия кредитных решений в реальном времени. Ранее в Ozon Tech участвовал в production-системах для 60000+ пользователей. Автор AdalQarau — платформы аналитики госзакупок с алгоритмами обнаружения коррупционных рисков.",

    // Skills
    skills-text: "Go, gRPC, REST/HTTP, PostgreSQL, Redis, Kafka, Docker, Camunda BPMN, MongoDB, Neo4j, Protocol Buffers, MinIO/S3, GitHub Actions, AWS, Kubernetes, testify, NixOS, Python.",

    // Experience - Bereke Bank
    bereke-title: "Middle Golang Developer",
    bereke-company: "Bereke Bank",
    bereke-date: "Сен 2025 — Наст. время",
    bereke-subtitle: "Auto Loan Issuance / Единый кредитный конвейер · production; high-load; event-driven; микросервисы",
    bereke-item-1: "Проектирую архитектуру и разрабатываю *единый кредитный конвейер* компании, который унифицирует подход к выдаче кредитов по продуктам и централизует маршрутизацию заявок.",
    bereke-item-2: "Реализовал множество *production-интеграций* с государственными и финансовыми сервисами, включая Первое кредитное бюро (ПКБ), реестры залогового имущества и верификацию личности.",
    bereke-item-3: "Спроектировал отказоустойчивую микросервисную архитектуру со строгими *latency SLA* и event-driven взаимодействием через Kafka.",
    bereke-item-4: "Ранее: сопровождал запуск крупного *кредитного конвейера автокредитования* с пилота до production-масштаба — распараллелил processing pipeline, *сократил время выдачи кредита с 40 до 15 минут* и помог вырастить поток с нуля до *130 заявок в день за полгода*; разработал библиотеку алертинга в корпоративный мессенджер.",
    bereke-item-5: "",
    bereke-stack: "Go, PostgreSQL, Redis, Kafka, Camunda BPMN, Docker, GraphQL, REST, CI/CD",

    // Experience - Ozon Junior
    ozon-jr-title: "Junior Golang Developer",
    ozon-jr-company: "Ozon Tech",
    ozon-jr-date: "Авг 2024 — Сен 2025",
    ozon-jr-subtitle: "Корпоративный портал сотрудников (10000-15000 DAU / 40000+ MAU) · production; монолит → микросервисы",
    ozon-jr-item-1: "Участвовал в проектировании и декомпозиции большого монолита портала сотрудников на микросервисы; в рамках своего домена оптимизировал нагрузку на ядро на 20–25%.",
    ozon-jr-item-2: "Разработал *staff-lib* — внутренний Go SDK для паттернов работы с БД, валидации и middleware — внедрён как стандарт в 30+ сервисах.",
    ozon-jr-item-3: "Реализовал автоматизированную *систему контроля посещаемости* с интеллектуальным высвобождением мест и блокировкой нарушителей для 60000+ сотрудников; платформа выдержала *2000 одновременных пользователей* на пике запуска Staff 2.0.",
    ozon-jr-item-4: "Построил *ETL-конвейер* из внутренней платформы опросов в хранилище Vertica, открыв self-service аналитику для кросс-функциональных команд.",
    ozon-jr-item-5: "Спроектировал *инфраструктуру генерации документов* с настраиваемым шаблонизатором для корпоративной отчётности.",
    ozon-jr-item-6: "Реализовал *сервис генерации превью видео* и backend-оптимизации обработки больших файлов во внутреннем сервисе хранения файлов, включая видеофайлы объёмом до *нескольких ТБ на файл*.",
    ozon-jr-stack: "Go, gRPC, PostgreSQL, ClickHouse, Redis, Kafka, Vertica, Prometheus, Grafana",

    // Experience - Ozon Intern
    ozon-intern-title: "Intern/Junior Golang Developer",
    ozon-intern-company: "Ozon Tech",
    ozon-intern-date: "Дек 2023 — Авг 2024",
    ozon-intern-subtitle: "Ozon Matrix (корпоративная платформа найма) · production; микросервисы; высокая нагрузка",
    ozon-intern-item-1: "Устранил критические узкие места в запросах платформы найма — *многократное ускорение* при генерации рейтингов кандидатов под production-нагрузкой.",
    ozon-intern-item-2: "Переработал *логику фильтрации ElasticSearch*: рост пропускной способности в 2.5 раза и снижение нагрузки на кластер через реструктуризацию запросов.",
    ozon-intern-item-3: "Спроектировал и реализовал *gRPC-микросервис уведомлений* для корпоративного мессенджера (Mattermost) с шардированием запросов через Kafka и настраиваемой отложенной отправкой — сократил время ответа менеджеров на заявки кандидатов.",
    ozon-intern-item-4: "Создал *observability-слой на Grafana* для платформы найма — дашборды проактивного обнаружения аномалий, снизившие время реагирования на инциденты.",
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
    project-item-1: "Реализовал *детектирование коррупционных рисков* по 14.47 млн контрактов, 197 тыс. заказчиков и 800 тыс. поставщиков с 8 алгоритмами без обучающих данных.",
    project-item-2: "",
    project-item-3: "Система выявила 448 тыс. рисковых флагов по всем 20 регионам Казахстана; пороги откалиброваны с государственными аудиторами; результаты применяются в реальных проверках счётных комитетов.",
    project-stack: "Go, ConnectRPC, PostgreSQL, React, TypeScript, MinIO/S3, Docker, Protobuf",
  ),
)

// Helper function to get translation (strings are parsed as markup so *bold* works)
#let t(key, lang: "en") = {
  let val = translations.at(lang).at(key, default: key)
  if type(val) == str { eval(val, mode: "markup") } else { val }
}
