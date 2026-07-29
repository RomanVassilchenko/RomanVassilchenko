export type Locale = 'en' | 'ru'

const en = {
  meta: {
    title: 'Roman Vassilchenko — Go backend engineer',
    description:
      'Go backend engineer in Astana, building credit decision systems and high-load platforms.',
  },
  nav: {
    experience: 'Experience',
    work: 'Selected work',
    contact: 'Contact',
    resume: 'Résumé',
  },
  hero: {
    name: 'Roman Vassilchenko',
    headline: 'Roman Vassilchenko',
    role: 'Go backend engineer',
    location: 'Astana, Kazakhstan · UTC+5',
    summary:
      'I build reliable backend systems that make complex business processes faster and easier to operate. Currently working on credit decision infrastructure at Bereke Bank; previously at Ozon.',
  },
  about: {
    title: 'About',
    body: 'I began working professionally with Go in 2023 on Ozon’s hiring platform, then moved to its company-wide employee portal. Today I design credit decision infrastructure at Bereke Bank. Across these roles, my work has stayed at the intersection of distributed systems, business-critical workflows, and production reliability. I care about clear service boundaries, predictable failure handling, and improvements that can be measured in production.',
  },
  experience: {
    title: 'Work experience',
    items: [
      {
        company: 'Bereke Bank',
        role: 'Middle Golang Developer',
        team: 'Unified Credit Pipeline / Auto Loan Issuance',
        period: 'Sep 2025 — present',
        summary:
          'Designing the bank’s unified credit pipeline, government and financial data integrations, and high-load microservice orchestration.',
        highlights: [
          'Took an auto-loan pipeline from pilot to production and reduced issuance time from 40 to 15 minutes.',
          'Built Kafka-based communication, latency controls, fallback logic, and operational alerting.',
        ],
        tech: 'Go · PostgreSQL · Camunda · Kafka · Docker · GraphQL · REST',
      },
      {
        company: 'Ozon',
        role: 'Junior Go Backend Engineer',
        team: 'Employee Portal',
        period: 'Aug 2024 — Sep 2025',
        summary:
          'Built employee data, compliance, office operations, analytics, and document workflows in a three-person backend team.',
        highlights: [
          'Co-designed a monolith split into roughly 10 domain services and reduced employee-data lookup time by 25%.',
          'Automated attendance workflows for 10,000+ employees; the platform sustained 2,000 concurrent users at rollout.',
        ],
        tech: 'Go · gRPC · PostgreSQL · ClickHouse · Kafka · Redis · Grafana',
      },
      {
        company: 'Ozon',
        role: 'Go Backend Intern',
        team: 'Hiring Portal',
        period: 'Dec 2023 — Aug 2024',
        summary:
          'Worked on the core service behind Ozon’s hiring platform and progressed from reporting tasks to on-call production ownership.',
        highlights: [
          'Reduced candidate-search p95 from 1.5–2 seconds to 500–850 ms through SQL and Elasticsearch improvements.',
          'Built reliable delayed candidate notifications with Kafka and monitoring in Grafana.',
        ],
        tech: 'Go · gRPC · PostgreSQL · Elasticsearch · Kafka · ClickHouse',
      },
    ],
  },
  work: {
    title: 'Selected work',
    items: [
      {
        name: 'AdalQarau',
        href: 'https://adalqarau.kz',
        description:
          'Public procurement analytics for Kazakhstan: 15M+ contracts, eight rule-based risk indicators, and 448K risk flags across 20 regions.',
      },
      {
        name: 'Auto-loan issuance pipeline',
        description:
          'Production credit workflow spanning Camunda orchestration, Kafka events, PostgreSQL persistence, and external data integrations.',
      },
    ],
  },
  skills: {
    title: 'Tools',
    rows: [
      ['Backend', 'Go, gRPC, REST, GraphQL, Protobuf'],
      ['Data', 'PostgreSQL, ClickHouse, Redis, Elasticsearch, Vertica, MinIO'],
      ['Systems', 'Kafka, Camunda, microservices, event-driven architecture'],
      ['Operations', 'Docker, Linux, Grafana, Prometheus, Git'],
    ],
  },
  education: {
    title: 'Education',
    degree: 'B.Sc. Software Engineering',
    school: 'Astana IT University',
    period: '2023 — 2025',
    note: 'Backend and distributed systems. Previous studies at ITMO University, 2021–2023.',
    thesis: 'Bachelor thesis',
  },
  contact: {
    title: 'Contact',
    intro: 'The fastest way to reach me is Telegram. Email works too.',
  },
  footer: 'Astana · Go backend · English / Russian · Updated July 2026',
}

const ru: typeof en = {
  meta: {
    title: 'Роман Васильченко — Go backend-разработчик',
    description:
      'Go backend-разработчик из Астаны: кредитные системы и высоконагруженные платформы.',
  },
  nav: {
    experience: 'Опыт',
    work: 'Проекты',
    contact: 'Контакты',
    resume: 'Резюме',
  },
  hero: {
    name: 'Роман Васильченко',
    headline: 'Роман Васильченко',
    role: 'Go backend-разработчик',
    location: 'Астана, Казахстан · UTC+5',
    summary:
      'Разрабатываю надёжные backend-системы, которые ускоряют сложные бизнес-процессы и упрощают их эксплуатацию. Сейчас работаю над кредитной инфраструктурой Bereke Bank, до этого — в Ozon.',
  },
  about: {
    title: 'Обо мне',
    body: 'Начал профессионально работать с Go в 2023 году над платформой найма Ozon, затем перешёл в команду корпоративного портала сотрудников. Сейчас проектирую инфраструктуру кредитных решений в Bereke Bank. Во всех этих ролях моя работа находилась на пересечении распределённых систем, критичных бизнес-процессов и production-надежности. Ценю ясные границы сервисов, предсказуемую обработку сбоев и результаты, которые можно измерить в production.',
  },
  experience: {
    title: 'Опыт работы',
    items: [
      {
        company: 'Bereke Bank',
        role: 'Middle Golang Developer',
        team: 'Единый кредитный конвейер / Автокредитование',
        period: 'Сен 2025 — настоящее время',
        summary:
          'Проектирую единый кредитный конвейер банка, интеграции с государственными и финансовыми источниками и high-load оркестрацию микросервисов.',
        highlights: [
          'Довёл конвейер автокредитования от пилота до production и сократил время выдачи с 40 до 15 минут.',
          'Реализовал Kafka-взаимодействие, контроль latency, fallback-логику и операционный алертинг.',
        ],
        tech: 'Go · PostgreSQL · Camunda · Kafka · Docker · GraphQL · REST',
      },
      {
        company: 'Ozon',
        role: 'Junior Go Backend Engineer',
        team: 'Портал сотрудника',
        period: 'Авг 2024 — Сен 2025',
        summary:
          'Разрабатывал данные сотрудников, compliance, офисные, аналитические и документные процессы в backend-команде из трёх человек.',
        highlights: [
          'Участвовал в декомпозиции монолита примерно на 10 сервисов и сократил время получения данных сотрудников на 25%.',
          'Автоматизировал посещаемость для 10 000+ сотрудников; при запуске платформа выдержала 2 000 одновременных пользователей.',
        ],
        tech: 'Go · gRPC · PostgreSQL · ClickHouse · Kafka · Redis · Grafana',
      },
      {
        company: 'Ozon',
        role: 'Go Backend Intern',
        team: 'Портал найма',
        period: 'Дек 2023 — Авг 2024',
        summary:
          'Работал над основным сервисом платформы найма и вырос от SQL-выгрузок до дежурств и production-ответственности.',
        highlights: [
          'Сократил p95 поиска кандидатов с 1,5–2 секунд до 500–850 мс за счёт улучшений SQL и Elasticsearch.',
          'Разработал надёжные отложенные уведомления через Kafka и мониторинг в Grafana.',
        ],
        tech: 'Go · gRPC · PostgreSQL · Elasticsearch · Kafka · ClickHouse',
      },
    ],
  },
  work: {
    title: 'Избранные проекты',
    items: [
      {
        name: 'AdalQarau',
        href: 'https://adalqarau.kz',
        description:
          'Аналитика госзакупок Казахстана: 15+ млн договоров, восемь индикаторов риска и 448 тыс. рисковых флагов во всех 20 регионах.',
      },
      {
        name: 'Конвейер автокредитования',
        description:
          'Production-процесс с Camunda-оркестрацией, Kafka-событиями, PostgreSQL и внешними финансовыми интеграциями.',
      },
    ],
  },
  skills: {
    title: 'Инструменты',
    rows: [
      ['Backend', 'Go, gRPC, REST, GraphQL, Protobuf'],
      ['Данные', 'PostgreSQL, ClickHouse, Redis, Elasticsearch, Vertica, MinIO'],
      ['Системы', 'Kafka, Camunda, микросервисы, event-driven архитектура'],
      ['Эксплуатация', 'Docker, Linux, Grafana, Prometheus, Git'],
    ],
  },
  education: {
    title: 'Образование',
    degree: 'Бакалавр программной инженерии',
    school: 'Astana IT University',
    period: '2023 — 2025',
    note: 'Backend и распределённые системы. До этого учился в Университете ИТМО, 2021–2023.',
    thesis: 'Дипломная работа',
  },
  contact: {
    title: 'Контакты',
    intro: 'Быстрее всего отвечаю в Telegram. Также можно написать на почту.',
  },
  footer: 'Астана · Go backend · Русский / English · Обновлено в июле 2026',
}

export const resume = { en, ru }
