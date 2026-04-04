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
    summary: "Go backend engineer specializing in high-load distributed systems and financial infrastructure. At Bereke Bank I architect a unified credit pipeline from scratch — engineering government data integrations and fault-tolerant high-throughput microservices for real-time credit decisioning. Previously at Ozon Tech, contributed to production systems serving 60000+ users. Creator of AdalQarau, a public procurement analytics platform processing 6.1 million+ contracts with corruption risk detection.",

    // Skills
    skills-text: "Go, gRPC, REST/HTTP, PostgreSQL, Redis, Kafka, Docker, Camunda BPMN, MongoDB, Neo4j, Protocol Buffers, MinIO/S3, GitHub Actions, AWS, Kubernetes, testify, NixOS, Python.",

    // Experience - Bereke Bank
    bereke-title: "Middle Golang Developer",
    bereke-company: "Bereke Bank",
    bereke-date: "Sep 2025 — Present",
    bereke-subtitle: "Unified Credit Pipeline · production; high-load; event-driven; microservices",
    bereke-item-1: "Contributing to the architecture planning and development of a *unified credit pipeline* — the central system routing and validating every retail credit application across all loan products through government data sources and core banking.",
    bereke-item-2: "Engineering *20+ production integrations* with government data sources: First Credit Bureau (FCB), collateral registries, identity verification — automated data backbone enabling sub-second credit risk decisioning.",
    bereke-item-3: "Designing fault-tolerant microservice architecture where each application orchestrates *20+ downstream service calls* under strict latency SLA via Kafka.",
    bereke-item-4: "Previously: delivered *collateral-backed auto loan platform* — optimized and parallelized processing pipeline, *reducing loan issuance time from 40 to 15 minutes*; built a library for corporate messenger alerting.",
    bereke-item-5: "",
    bereke-stack: "Go, PostgreSQL, Redis, Kafka, Camunda BPMN, Docker, GraphQL, REST, CI/CD",

    // Experience - Ozon Junior
    ozon-jr-title: "Junior Golang Developer",
    ozon-jr-company: "Ozon Tech",
    ozon-jr-date: "Aug 2024 — Sep 2025",
    ozon-jr-subtitle: "Enterprise Employee Portal (10000-15000 DAU / 40000+ MAU) · production; monolith → microservices",
    ozon-jr-item-1: "Designed and extracted the *employee data domain* into an autonomous service as part of monolith decomposition — reduced core system load by 20–25%.",
    ozon-jr-item-2: "Built *staff-lib* — internal Go SDK for DB access patterns, validation, and middleware — adopted as the standard across 30+ services.",
    ozon-jr-item-3: "Developed automated *attendance management system* with intelligent seat reclamation and enforcement logic across 60000+ employees; platform sustained *2000 concurrent users* during Staff 2.0 launch peaks.",
    ozon-jr-item-4: "Engineered an *ETL pipeline* from Ozon Forms to Vertica, enabling self-service analytics for cross-functional teams.",
    ozon-jr-item-5: "Designed *document generation infrastructure* with configurable templating engine for enterprise-wide corporate reporting.",
    ozon-jr-item-6: "Delivered *video preview generation* service and backend optimizations for large-file processing in Ozon Disk, including video assets up to *several TB per file*.",
    ozon-jr-stack: "Go, gRPC, PostgreSQL, ClickHouse, Redis, Kafka, Vertica, Prometheus, Grafana",

    // Experience - Ozon Intern
    ozon-intern-title: "Intern/Junior Golang Developer",
    ozon-intern-company: "Ozon Tech",
    ozon-intern-date: "Dec 2023 — Aug 2024",
    ozon-intern-subtitle: "Ozon Matrix (Company-wide Hiring Platform) · production; microservices; high traffic",
    ozon-intern-item-1: "Eliminated critical query bottlenecks in the hiring platform's candidate ranking — *8× speedup* on production SQL under peak load.",
    ozon-intern-item-2: "Redesigned *ElasticSearch filter execution*: 2.5× throughput improvement and significant cluster load reduction through query restructuring.",
    ozon-intern-item-3: "Designed and built a *gRPC notification microservice* for Chatzone (Mattermost) with Kafka-based request sharding and configurable delayed dispatch — cut manager response time to candidate applications.",
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
    project-item-1: "Built *rule-based corruption risk detection* across 14.47 million contracts, 197 thousand buyers and 800 thousand suppliers — \$24 billion USD in annual procurement volume, 8 indicator algorithms operating without labeled training data.",
    project-item-2: "Engineered Go backend with *inverted-index algorithm* for collusion detection, automated data ingestion pipelines and 10-minute refresh cycle on an 84 GB dataset.",
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
    summary: "Go backend-инженер, специализирующийся на высоконагруженных распределённых системах и финансовой инфраструктуре. В Bereke Bank проектирую единый кредитный конвеер с нуля — разрабатываю государственные интеграции и отказоустойчивые микросервисы для принятия кредитных решений в реальном времени. Ранее в Ozon Tech участвовал в production-системах для 60000+ пользователей. Автор AdalQarau — платформы аналитики госзакупок с обработкой 6.1 млн+ контрактов и алгоритмами обнаружения коррупционных рисков.",

    // Skills
    skills-text: "Go, gRPC, REST/HTTP, PostgreSQL, Redis, Kafka, Docker, Camunda BPMN, MongoDB, Neo4j, Protocol Buffers, MinIO/S3, GitHub Actions, AWS, Kubernetes, testify, NixOS, Python.",

    // Experience - Bereke Bank
    bereke-title: "Middle Golang Developer",
    bereke-company: "Bereke Bank",
    bereke-date: "Сен 2025 — Наст. время",
    bereke-subtitle: "Единый кредитный конвеер · production; high-load; event-driven; микросервисы",
    bereke-item-1: "Участвую в проектировании архитектуры и разработке *единого кредитного конвеера* — центральной системы маршрутизации и валидации каждой кредитной заявки по всем продуктам через государственные источники данных и банковское ядро.",
    bereke-item-2: "Разрабатываю *20+ production-интеграций* с государственными источниками данных: Первое кредитное бюро (ПКБ), реестры залогового имущества, верификация личности — автоматизированный слой данных для принятия кредитных решений в реальном времени.",
    bereke-item-3: "Проектирую отказоустойчивую микросервисную архитектуру, где каждая заявка оркестрирует *20+ downstream-вызовов* при строгих latency SLA и event-driven подходе через Kafka.",
    bereke-item-4: "Ранее: запустил *платформу автокредитования под залог* — оптимизировал и распараллелил processing pipeline, *сократив время выдачи кредита с 40 до 15 минут*; разработал библиотеку алертинга в корпоративный мессенджер.",
    bereke-item-5: "",
    bereke-stack: "Go, PostgreSQL, Redis, Kafka, Camunda BPMN, Docker, GraphQL, REST, CI/CD",

    // Experience - Ozon Junior
    ozon-jr-title: "Junior Golang Developer",
    ozon-jr-company: "Ozon Tech",
    ozon-jr-date: "Авг 2024 — Сен 2025",
    ozon-jr-subtitle: "Корпоративный портал сотрудников (10000-15000 DAU / 40000+ MAU) · production; монолит → микросервисы",
    ozon-jr-item-1: "Спроектировал и реализовал выделение *домена данных сотрудников* в автономный сервис в рамках декомпозиции монолита — снизил нагрузку на ядро на 20–25%.",
    ozon-jr-item-2: "Разработал *staff-lib* — внутренний Go SDK для паттернов работы с БД, валидации и middleware — внедрён как стандарт в 30+ сервисах.",
    ozon-jr-item-3: "Реализовал автоматизированную *систему контроля посещаемости* с интеллектуальным высвобождением мест и блокировкой нарушителей для 60000+ сотрудников; платформа выдержала *2000 одновременных пользователей* на пике запуска Staff 2.0.",
    ozon-jr-item-4: "Построил *ETL-конвейер* из Ozon Forms в хранилище Vertica, открыв self-service аналитику для кросс-функциональных команд.",
    ozon-jr-item-5: "Спроектировал *инфраструктуру генерации документов* с настраиваемым шаблонизатором для корпоративной отчётности.",
    ozon-jr-item-6: "Реализовал *сервис генерации превью видео* и backend-оптимизации обработки больших файлов в Ozon Disk, включая видеофайлы объёмом до *нескольких ТБ на файл*.",
    ozon-jr-stack: "Go, gRPC, PostgreSQL, ClickHouse, Redis, Kafka, Vertica, Prometheus, Grafana",

    // Experience - Ozon Intern
    ozon-intern-title: "Intern/Junior Golang Developer",
    ozon-intern-company: "Ozon Tech",
    ozon-intern-date: "Дек 2023 — Авг 2024",
    ozon-intern-subtitle: "Ozon Matrix (корпоративная платформа найма) · production; микросервисы; высокая нагрузка",
    ozon-intern-item-1: "Устранил критические узкие места в запросах платформы найма — *ускорение в 8×* при генерации рейтингов кандидатов под production-нагрузкой.",
    ozon-intern-item-2: "Переработал *логику фильтрации ElasticSearch*: рост пропускной способности в 2.5× и снижение нагрузки на кластер через реструктуризацию запросов.",
    ozon-intern-item-3: "Спроектировал и реализовал *gRPC-микросервис уведомлений* для Chatzone (Mattermost) с шардированием запросов через Kafka и настраиваемой отложенной отправкой — сократил время ответа менеджеров на заявки кандидатов.",
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
    project-item-1: "Реализовал *детектирование коррупционных рисков* по 14.47 млн контрактов, 197 тыс. заказчиков и 800 тыс. поставщиков — \$24 млрд США годового объёма закупок, 8 алгоритмов без обучающих данных.",
    project-item-2: "Разработал Go-бэкенд с *алгоритмом инвертированного индекса* для обнаружения сговора, автоматизированными конвейерами загрузки данных и циклом обновления каждые 10 минут на датасете 84 ГБ.",
    project-item-3: "Система выявила 448 тыс. рисковых флагов по всем 20 регионам Казахстана; пороги откалиброваны с государственными аудиторами; результаты применяются в реальных проверках счётных комитетов.",
    project-stack: "Go, ConnectRPC, PostgreSQL, React, TypeScript, MinIO/S3, Docker, Protobuf",
  ),
)

// Helper function to get translation (strings are parsed as markup so *bold* works)
#let t(key, lang: "en") = {
  let val = translations.at(lang).at(key, default: key)
  if type(val) == str { eval(val, mode: "markup") } else { val }
}
