export default {
  nav: {
    experience: 'Experience',
    skills: 'Toolkit',
    projects: 'Selected work',
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
    role: 'Go Backend Engineer · Bereke Bank',
    location: 'Astana, Kazakhstan · UTC+5',
    profileLabel: 'Profile',
    headline: 'Go backend engineer building reliable fintech and high-load platforms.',
    summary:
      'I build backend systems that accelerate critical business workflows and stay reliable under load, from credit pipelines at Bereke Bank to internal platforms and shared libraries at Ozon.',
    metrics: {
      issuance: {
        value: '>2.5×',
        label: 'Faster auto-loan issuance',
        detail: 'More than 2.5× faster, from 40 to 15 minutes',
        href: '#projects',
      },
      adoption: {
        value: '30+',
        label: 'Services using shared libraries',
        detail: 'Developed and maintained internal Go libraries at Ozon',
        href: '#experience-ozonStaff',
      },
      search: {
        value: '3×',
        label: 'Faster search in Ozon Hiring',
        detail: 'Reworked Elasticsearch filtering and reduced cluster load',
        href: '#experience-ozonIntern',
      },
    },
    cta: {
      resume: 'Open resume',
      contact: 'Discuss a role',
      projects: 'Selected work',
    },
  },
  experience: {
    kicker: 'Experience',
    title: 'Production systems, not side-project scale.',
    intro:
      'A track record across banking and company-wide platforms: architecture, delivery, reliability, and measurable operational outcomes.',
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
          "Architect and build the company's unified credit pipeline, standardizing loan issuance across products and centralizing application routing",
          'Built numerous production integrations with government and financial services, including FCB, collateral registries, and identity verification',
          'Designed fault-tolerant microservice architecture with strict latency SLA and event-driven communication via Kafka',
          'Supported the launch of a large auto-loan credit pipeline from pilot to production scale: parallelized processing, made issuance more than 2.5× faster, from 40 to 15 minutes, and grew volume from zero to 130 applications per day within six months',
          'Built a corporate messenger alerting library and operational notifications for production workflows',
        ],
        tech: ['Go', 'PostgreSQL', 'Camunda', 'Kafka', 'Docker', 'GraphQL', 'REST'],
      },
      ozonStaff: {
        company: 'Ozon',
        role: 'Junior/Middle Golang Developer',
        team: 'Employee Portal Team',
        period: 'Aug 2024 to Sep 2025',
        description:
          "Worked at Ozon across two company-wide products: started on the hiring portal as a full-time Go backend intern, then moved to the employee portal in a Junior/Middle role. Built and maintained internal tooling for Ozon's employee platform serving 10000-15000 daily users and 40000+ monthly active users across a large microservice ecosystem before moving to Bereke Bank.",
        achievements: [
          'Helped migrate a large employee-portal monolith to microservices; reduced pod load by 20-25% within my domain',
          'Actively maintained internal Go libraries: built shared DB, validation, and middleware components used by 30+ services, strengthening a culture of reusable engineering solutions',
          'Helped launch Staff 2.0 and sustained 2000 concurrent users during peak rollout',
          'Implemented complex office attendance logic with seat reclamation and no-show enforcement across 60000+ employees',
          'Built ETL pipelines from internal survey platform to Vertica for self-service analytics',
          'Designed document generation infrastructure with configurable templates for enterprise reporting',
          'Improved internal cloud storage large-file workflows and video preview generation for assets up to several TB per file',
        ],
        tech: ['Go', 'gRPC', 'PostgreSQL', 'ClickHouse', 'Vertica', 'Kafka', 'Redis', 'Grafana'],
      },
      ozonIntern: {
        company: 'Ozon',
        role: 'Intern/Junior Golang Developer',
        team: 'Hiring Portal Team',
        period: 'Dec 2023 to Aug 2024',
        description:
          'Started at Ozon as a full-time Go backend intern and shipped production features for a company-wide hiring platform handling thousands of applications across all Ozon entities.',
        achievements: [
          'Optimized complex SQL queries for candidate selection, achieving significant response time improvements',
          'Re-engineered ElasticSearch filtering logic, making search in the Ozon hiring platform 3× faster while reducing cluster load',
          'Developed a gRPC-based notification service integrating corporate messenger (Mattermost)',
          'Implemented Kafka-based delayed message delivery and sharding for reliable and scalable notification processing',
          'Designed Grafana dashboards for real-time monitoring of hiring pipeline metrics and system errors',
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
    title: 'Tools chosen for throughput and operability.',
    intro:
      'Technologies used to build, integrate, observe, and operate the production systems above.',
    categories: {
      backend: 'Backend',
      data: 'Data & storage',
      distributed: 'Distributed systems',
      operations: 'Operations',
    },
  },
  projects: {
    kicker: 'Selected systems',
    title: 'Engineering decisions tied to real outcomes.',
    intro:
      'A selection of banking, platform, and analytics systems where backend work moved delivery speed, scale, or reliability.',
    public: 'Public product',
    internal: 'Internal system',
    outcomes: 'Measured outcomes',
    contribution: 'My contribution',
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
        name: 'Employee Portal: Monolith to Microservices',
        description: 'Enterprise platform for 60000+ employees',
        details:
          'Migration of the employee portal from a monolith to microservices, alongside shared infrastructure, document generation, and large-file workflows for a system serving 10000-15000 DAU and 40000+ MAU.',
        contribution:
          'Served as the primary developer responsible for reworking internal user-data storage, office-booking workflows, and corporate messenger integrations.',
        highlights: [
          'Pod load reduced by 20-25%',
          '2000 concurrent users during the new portal rollout peak',
          'Developed and maintained internal libraries used by 30+ services',
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
          'Candidate ranking SQL significantly accelerated',
          'Search in the Ozon hiring platform made 3× faster',
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
    title: 'Research grounded in real data.',
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
    title: 'Looking for a Go engineer for fintech or distributed-systems work?',
    subtitle:
      'Send the role, team context, and the problem you need solved. Email is the fastest way to reach me.',
    emailCta: 'Email Roman',
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
