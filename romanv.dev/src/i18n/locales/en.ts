export default {
  nav: {
    experience: 'Experience',
    skills: 'Skills',
    projects: 'Projects',
    education: 'Education',
    contact: 'Contact',
  },
  hero: {
    greeting: "Hi, I'm",
    name: 'Roman Vassilchenko',
    title: 'Go Backend Engineer: credit platforms, integrations, high-load systems',
    location: 'Astana, Kazakhstan',
    currentWork: 'Building high-load systems at',
    company: 'Bereke Bank',
    proofPoints: [
      'Unified credit pipeline systems and lending backend architecture',
      'Production integrations with government and financial services',
      'Go, Kafka, PostgreSQL, microservices, and observability',
    ],
    cta: {
      resume: 'View Resume',
      contact: 'Get in Touch',
    },
  },
  experience: {
    title: 'Professional Experience',
    present: 'Present',
    positions: {
      bereke: {
        company: 'Bereke Bank',
        role: 'Middle Golang Developer',
        team: 'Auto Loan Issuance Team / Unified Credit Pipeline Team',
        period: 'Sep 2025 – Present',
        description:
          "Building unified credit decision infrastructure at one of Kazakhstan's major banks: a credit pipeline, government data integrations, and high-load microservice orchestration.",
        achievements: [
          "Architect and build the company's unified credit pipeline, standardizing loan issuance across products and centralizing application routing",
          'Built numerous production integrations with government and financial services, including FCB, collateral registries, and identity verification',
          'Designed fault-tolerant microservice architecture with strict latency SLA and event-driven communication via Kafka',
          'Supported the launch of a large auto-loan credit pipeline from pilot to production scale: parallelized processing, reduced issuance time from 40 to 15 minutes, and grew volume from zero to 130 applications per day within six months',
          'Built a corporate messenger alerting library and operational notifications for production workflows',
        ],
        tech: ['Go', 'PostgreSQL', 'Camunda', 'Kafka', 'Docker', 'GraphQL', 'REST'],
      },
      ozonStaff: {
        company: 'Ozon',
        role: 'Junior Golang Developer',
        team: 'Staff Team',
        period: 'Aug 2024 – Sep 2025',
        description:
          "Built and maintained internal tooling for Ozon's employee platform serving 10000-15000 daily users and 40000+ monthly active users across a large microservice ecosystem.",
        achievements: [
          'Contributed to the design and decomposition of a large employee-portal monolith into microservices; optimized core load by 20–25% within my domain',
          'Designed and developed staff-lib — shared internal library for DB access, validation, and middleware, adopted across 30+ services',
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
        team: 'Matrix Hiring Team',
        period: 'Dec 2023 – Aug 2024',
        description:
          'Worked on company-wide hiring platform handling thousands of applications across all Ozon entities. Shipped production features from the first weeks as a full-time intern.',
        achievements: [
          'Optimized complex SQL queries for candidate selection, achieving significant response time improvements',
          'Re-engineered ElasticSearch filtering logic, improving search performance by 2.5× and reducing cluster load',
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
    title: 'Tech Stack',
    categories: {
      languages: 'Languages & Frameworks',
      databases: 'Databases & Storage',
      messaging: 'Message Brokers & Orchestration',
      monitoring: 'Monitoring & Observability',
      devops: 'DevOps & Tools',
    },
  },
  projects: {
    title: 'Featured Projects',
    featuredCase: 'Featured case study',
    viewMore: 'View More',
    items: {
      adalqarau: {
        name: 'AdalQarau',
        url: 'https://adalqarau.kz',
        description: 'Public Procurement Analytics Platform',
        details:
          "Rule-based corruption risk detection platform for Kazakhstan's public procurement: 14.47 million contracts, 197 thousand buyers, 800 thousand suppliers, and 8 indicator algorithms operating without labeled data.",
        highlights: [
          '448 thousand risk flags across all 20 regions',
          '8 indicator algorithms without labeled data',
          'Thresholds calibrated with government auditors',
        ],
        tech: ['Go', 'PostgreSQL', 'MinIO', 'Kafka', 'GraphQL', 'Buf'],
      },
      staffPortal: {
        name: 'Staff Portal 2.0',
        description: 'Enterprise portal for 60000+ employees',
        details:
          'Employee platform modernization: monolith decomposition, shared infrastructure, document generation, and large-file workflows for a system serving 10000-15000 DAU and 40000+ MAU.',
        highlights: [
          'Core load reduced by 20–25%',
          '2000 peak concurrent users at Staff 2.0 launch',
          'Staff-lib adopted across 30+ services',
        ],
        tech: ['Go', 'PostgreSQL', 'Kafka', 'Redis', 'Grafana'],
      },
      matrixHiring: {
        name: 'Matrix Hiring',
        description: 'Hiring system from job post to onboarding',
        details:
          'High-load hiring platform work spanning candidate ranking, search, notifications, and observability for company-wide recruiting workflows.',
        highlights: [
          'Candidate ranking SQL significantly accelerated',
          'ElasticSearch filters improved by 2.5×',
          'Kafka-sharded notification service with Grafana monitoring',
        ],
        tech: ['Go', 'PostgreSQL', 'ElasticSearch', 'Kafka'],
      },
      autoLoan: {
        name: 'Auto-Loan Issuance Pipeline',
        description: 'B2C pipeline for collateral-backed auto loans',
        details:
          'Credit issuance backend spanning gRPC APIs, Camunda workflows, Kafka events, PostgreSQL persistence, and external data integrations for auto-loan processing.',
        highlights: [
          'Launched from pilot to production scale',
          'Grew from zero to 130 applications per day within six months',
          'Reduced loan issuance time from 40 to 15 minutes',
        ],
        tech: ['Go', 'gRPC', 'Camunda', 'Kafka', 'PostgreSQL'],
      },
    },
  },
  education: {
    title: 'Education',
    thesis: 'Bachelor Thesis',
    degrees: {
      masters: {
        degree: 'M.Sc. Computer Science & Engineering',
        school: 'Astana IT University',
        location: 'Kazakhstan',
        period: '2025 – Present',
        focus:
          'Research topic: Intelligent Methods for Analyzing and Detecting Anomalies in Tender Procurement Data',
      },
      bachelors: {
        degree: 'B.Sc. Software Engineering',
        school: 'Astana IT University',
        location: 'Kazakhstan',
        period: '2023 – 2025',
        focus: 'Backend & Distributed Systems Focus',
        note: 'Previous studies: ITMO University, St. Petersburg (2021-2023)',
      },
    },
  },
  contact: {
    title: 'Get in Touch',
    subtitle:
      'Available for Go backend roles where engineering directly affects product throughput, integrations, and reliability.',
    email: 'Email',
    telegram: 'Telegram',
    linkedin: 'LinkedIn',
    github: 'GitHub',
  },
  footer: {
    madeWith: 'Made with',
    and: 'and',
    documents: 'Documents',
    diploma: 'Bachelor Thesis',
  },
  theme: {
    light: 'Light',
    dark: 'Dark',
    system: 'System',
  },
}
