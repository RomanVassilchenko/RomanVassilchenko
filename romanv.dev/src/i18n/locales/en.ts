export default {
  nav: {
    experience: 'Experience',
    skills: 'Tools',
    projects: 'Projects',
    education: 'Education',
    contact: 'Contact',
    resume: 'Resume',
    skip: 'Skip to content',
    primaryLabel: 'Primary navigation',
    openMenu: 'Open navigation menu',
    closeMenu: 'Close navigation menu',
  },
  hero: {
    name: 'Roman Vassilchenko',
    role: 'Go backend engineer · fintech & platforms',
    location: 'Astana, Kazakhstan · UTC+5',
    current: 'Building at Bereke Bank',
    profileLabel: 'Profile',
    headline: 'Go backend engineer.',
    summary:
      'I work on credit decision systems at Bereke Bank. Previously, I built employee and hiring platform services at Ozon.',
    cta: {
      resume: 'Open resume',
      contact: 'Discuss a role',
      projects: 'Projects',
    },
  },
  experience: {
    kicker: 'Experience',
    title: 'Experience',
    intro: 'Backend development in banking, employee platforms, and hiring systems.',
    present: 'Present',
    positions: {
      bereke: {
        company: 'Bereke Bank',
        role: 'Middle Golang Developer',
        team: 'Auto Loan Issuance Team / Unified Credit Pipeline Team',
        period: 'Sep 2025 to present',
        description:
          "Building unified credit decision infrastructure at one of Kazakhstan's major banks: credit pipeline architecture, government and financial data integrations, and high-load microservice orchestration.",
        achievements: [
          "Design and build the bank's unified credit pipeline, standardizing routing, validation, and decision flows across loan products",
          'Own production integrations with government and financial systems, including credit bureau, collateral, and identity data',
          'Took an auto-loan pipeline from pilot to production: parallel processing cut issuance from 40 to 15 minutes and supported growth to 130 applications a day',
          'Built reliability into the workflow through latency controls, Kafka-based communication, fallback logic, and operational alerting',
        ],
        tech: ['Go', 'PostgreSQL', 'Camunda', 'Kafka', 'Docker', 'GraphQL', 'REST'],
      },
      ozonStaff: {
        company: 'Ozon',
        role: 'Junior Go Backend Engineer',
        team: 'Employee Portal Team',
        period: 'Aug 2024 to Sep 2025',
        description:
          "Joined a three-person backend team responsible for Ozon's company-wide employee platform. Combined on-call ownership with delivery across employee data, compliance workflows, office operations, analytics integrations, and document generation.",
        achievements: [
          'Co-designed the decomposition of a large monolith into roughly 10 domain services; built the employee-data service and cut average lookup time by 25%',
          'Sole backend owner of recurring compliance-questionnaire workflows, including employee assignment, notifications, and a legal administration interface',
          'Automated office attendance and no-show handling for 10000+ employees, including notifications and automatic seat reclamation; the platform sustained 2000 concurrent users at rollout',
          'Built the complete backend and a Go document generator for a new trademark-approval workflow',
          'Co-authored shared Go components for database access, middleware, retries, workers, and watchers; also delivered analytics exports and video-preview workflows for files up to 2 TB',
        ],
        tech: ['Go', 'gRPC', 'PostgreSQL', 'ClickHouse', 'Vertica', 'Kafka', 'Redis', 'Grafana'],
      },
      ozonIntern: {
        company: 'Ozon',
        role: 'Go Backend Intern',
        team: 'Hiring Portal Team',
        period: 'Dec 2023 to Aug 2024',
        description:
          'Worked in a four-person backend team on the core service behind Ozon’s hiring platform. Progressed from SQL reporting tasks to on-call support and production ownership.',
        achievements: [
          'Cut candidate-search p95 from 1.5-2 seconds to 500-850 ms by fixing SQL indexes and rewriting inefficient Elasticsearch queries; validated the result with repeated load tests',
          'Designed and built a notification bot for candidate updates, including reliable delayed delivery through Kafka',
          'Joined the on-call rotation, resolved long-standing production defects, and built Grafana dashboards for hiring-funnel anomalies and system errors',
        ],
        tech: [
          'Go',
          'gRPC',
          'REST',
          'PostgreSQL',
          'ElasticSearch',
          'Kafka',
          'ClickHouse',
          'Grafana',
        ],
      },
    },
  },
  skills: {
    kicker: 'Production toolkit',
    title: 'Production tools',
    intro: 'The technologies I use to build, integrate, and operate backend services.',
    categories: {
      backend: 'Backend',
      data: 'Data & storage',
      distributed: 'Distributed systems',
      operations: 'Operations',
    },
  },
  projects: {
    kicker: 'Backend',
    title: 'Projects',
    intro: 'A few systems I worked on and the concrete results.',
    public: 'Public product',
    internal: 'Internal system',
    outcomes: 'Results',
    contribution: 'Work',
    viewMore: 'View More',
    items: {
      adalqarau: {
        name: 'AdalQarau',
        url: 'https://adalqarau.kz',
        description: 'Public Procurement Analytics Platform',
        details:
          "Rule-based corruption risk detection platform for Kazakhstan's public procurement: more than 15 million contracts, 197 thousand buyers, 800 thousand suppliers, and 8 indicator algorithms operating without labeled data.",
        contribution:
          'Creator and backend engineer: designed the risk algorithms, data model, and processing pipeline.',
        highlights: [
          '448 thousand risk flags across all 20 regions',
          '8 indicator algorithms without labeled data',
          'Thresholds calibrated with government auditors',
        ],
        tech: ['Go', 'PostgreSQL', 'MinIO', 'Kafka', 'GraphQL', 'Buf'],
      },
      staffPortal: {
        name: 'Employee Platform: Monolith to Domain Services',
        description: 'Company-wide platform with a 2000-user rollout peak',
        details:
          'Decomposition of a large employee-platform monolith into roughly 10 domain services, alongside new compliance, office, document, analytics, and large-file workflows.',
        contribution:
          'Co-designed the service boundaries, built the employee-data service, and owned several business-critical workflows as part of a three-person backend team.',
        highlights: [
          'Average employee-data lookup time reduced by 25%',
          '2000 concurrent users during the new portal rollout peak',
          'Attendance automation and seat reclamation for 10000+ employees',
        ],
        tech: ['Go', 'PostgreSQL', 'Kafka', 'Redis', 'Grafana'],
      },
      matrixHiring: {
        name: 'Hiring Portal',
        description: 'Hiring system from job post to onboarding',
        details:
          'High-load hiring platform work spanning candidate ranking, search, notifications, and observability for company-wide recruiting workflows.',
        contribution:
          'Built backend search, notification, and observability improvements as a Go engineer.',
        highlights: [
          'Candidate-search p95 reduced from 1.5-2 s to 500-850 ms',
          'SQL indexes and Elasticsearch queries rebuilt and load-tested',
          'Kafka-sharded notification service with Grafana monitoring',
        ],
        tech: ['Go', 'PostgreSQL', 'ElasticSearch', 'Kafka'],
      },
      autoLoan: {
        name: 'Auto-Loan Issuance Pipeline',
        description: 'B2C pipeline for collateral-backed auto loans',
        details:
          'Credit issuance backend spanning Camunda workflows, Kafka events, PostgreSQL persistence, and external data integrations for auto-loan processing.',
        contribution:
          'Built credit-pipeline services and integrations, then supported the path from pilot to production scale.',
        highlights: [
          'Launched from pilot to production scale',
          'Grew from zero to 130 applications per day within six months',
          'Made auto-loan issuance more than 2.5× faster, from 40 to 15 minutes',
        ],
        tech: ['Go', 'Camunda', 'Kafka', 'PostgreSQL'],
      },
    },
  },
  education: {
    kicker: 'Education',
    title: 'Education',
    thesis: 'Read bachelor thesis (PDF)',
    degrees: {
      masters: {
        degree: 'M.Sc. Computer Science & Engineering',
        school: 'Astana IT University',
        location: 'Kazakhstan',
        period: '2025 to present',
        focus:
          'Research topic: Intelligent Methods for Analyzing and Detecting Anomalies in Tender Procurement Data',
      },
      bachelors: {
        degree: 'B.Sc. Software Engineering',
        school: 'Astana IT University',
        location: 'Kazakhstan',
        period: '2023 to 2025',
        focus: 'Backend & Distributed Systems Focus',
        note: 'Previous studies: ITMO University, St. Petersburg (2021-2023)',
      },
    },
  },
  contact: {
    kicker: 'Contact',
    title: 'Contact',
    subtitle: 'The fastest way to reach me is Telegram. You can also use email or LinkedIn.',
    primaryCta: 'Message on Telegram',
    otherChannels: 'Other channels',
    telegram: 'Telegram',
    linkedin: 'LinkedIn',
    github: 'GitHub',
  },
  footer: {
    status: 'Available for the right backend role',
    meta: 'Astana · Go Backend · EN / RU · Updated July 2026',
  },
  language: {
    change: 'Change language',
  },
  theme: {
    change: 'Change color theme',
    light: 'Light',
    dark: 'Dark',
    system: 'System',
  },
}
