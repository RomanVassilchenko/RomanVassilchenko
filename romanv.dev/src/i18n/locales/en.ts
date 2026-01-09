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
    title: 'Go Backend Engineer',
    location: 'Astana, Kazakhstan',
    currentWork: 'Working on auto loan system at',
    company: 'Bereke Bank',
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
        role: 'Middle Backend Developer',
        team: 'Auto Loan Issuance Team',
        period: 'Sep 2024 – Present',
        description:
          'Building car-collateralized auto loan system. Microservice architecture with business process orchestration via Camunda.',
        achievements: [
          'Designing and implementing credit issuance features via BPMN orchestration',
          'Government service integrations: collateral verification, identity check, credit history',
          'Building microservice architecture with integrations to internal banking systems',
          'Working on scoring systems and automated decision-making',
        ],
        tech: ['Go', 'PostgreSQL', 'Camunda', 'Kafka', 'Docker', 'Microservices'],
      },
      ozonStaff: {
        company: 'Ozon',
        role: 'Junior Go Developer',
        team: 'Staff Team',
        period: 'Sep 2023 – Sep 2024',
        description:
          'Built enterprise products for 60,000+ employees. Created key systems and led major legacy code refactoring.',
        achievements: [
          'Built trademark management system — platform for external brand licensing',
          'Decomposed Staff Portal monolith into microservices — 25% performance boost',
          'Created internal library adopted across dozens of microservices by other teams',
          'Ozon Form — developed key features for corporate data collection',
          'Ozon Disk — built functionality for enterprise storage solution',
          'Conflict of interest service — automated analysis of 60,000 employees for audits',
          'Office booking system — access pass & parking integration, auto-ban for no-shows',
        ],
        tech: ['Go', 'PostgreSQL', 'ElasticSearch', 'Kafka', 'Redis', 'Grafana'],
      },
      ozonIntern: {
        company: 'Ozon',
        role: 'Go Backend Intern',
        team: 'Matrix Hiring Team',
        period: 'Dec 2022 – Aug 2023',
        description:
          'Worked on Matrix hiring system — full cycle from job posting to employee onboarding.',
        achievements: [
          'Built notification service for HR and managers via corporate messenger',
          'Created stability monitoring and analytics dashboards',
          'Optimized database queries and API response times',
        ],
        tech: ['Go', 'PostgreSQL', 'ElasticSearch', 'Kafka'],
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
    viewMore: 'View More',
    items: {
      adalqarau: {
        name: 'AdalQarau',
        url: 'https://daca.kz',
        description: 'Public Procurement Analytics Platform',
        details:
          "Risk scoring system for Kazakhstan's public procurement. Graph-based relationship analysis between participants, automated anomaly detection, and report generation.",
        highlights: [
          'Anomaly detection algorithms',
          'Real-time data processing',
          'Advanced Excel report generation',
        ],
        tech: ['Go', 'PostgreSQL', 'MinIO', 'Kafka', 'GraphQL', 'Buf'],
      },
      staffPortal: {
        name: 'Staff Portal 2.0',
        description: 'Enterprise portal for 60,000+ employees',
        details:
          'Decomposed monolith into microservices with 25% performance boost. Built Ozon Form, Ozon Disk, trademark system, office booking, and conflict of interest service.',
        highlights: [
          'Monolith → microservices migration (+25% speed)',
          'Ozon Form, Ozon Disk, trademark system',
          'Created library used across dozens of microservices',
        ],
        tech: ['Go', 'PostgreSQL', 'Kafka', 'Redis', 'Grafana'],
      },
      matrixHiring: {
        name: 'Matrix Hiring',
        description: 'Hiring system from job post to onboarding',
        details:
          'Built notification service for HR and managers via corporate messenger. Created stability monitoring and analytics dashboards.',
        highlights: [
          'Messenger notification service',
          'Analytics and monitoring dashboards',
          'API performance optimization',
        ],
        tech: ['Go', 'PostgreSQL', 'ElasticSearch', 'Kafka'],
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
        period: '2025 – 2027',
        focus: 'Research: High-load Systems & ML',
      },
      bachelors: {
        degree: 'B.Sc. Computer Science',
        school: 'Astana IT University + ITMO University',
        location: 'Kazakhstan / Russia',
        period: '2021 – 2025',
        focus: 'Backend & Distributed Systems Focus',
        note: 'Years 1-2 at ITMO (St. Petersburg), Years 3-4 at AITU (Astana)',
      },
    },
  },
  contact: {
    title: 'Get in Touch',
    subtitle: "Let's connect and build something amazing together!",
    email: 'Email',
    telegram: 'Telegram',
    linkedin: 'LinkedIn',
    github: 'GitHub',
  },
  services: {
    title: 'Self-Hosted Services',
    subtitle: 'All infrastructure runs on NixOS with declarative configuration',
    items: {
      bitwarden: {
        name: 'Vaultwarden',
        description: 'Password manager',
      },
      joplin: {
        name: 'Joplin Server',
        description: 'Notes synchronization',
      },
      photos: {
        name: 'Immich',
        description: 'Photo library',
      },
      git: {
        name: 'Forgejo',
        description: 'Git hosting',
      },
      nixCache: {
        name: 'Nix Cache',
        description: 'Binary cache server',
      },
    },
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
