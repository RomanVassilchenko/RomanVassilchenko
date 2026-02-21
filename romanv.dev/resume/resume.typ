// Resume template with localization support
// Compile with: typst compile resume.typ --input lang=en resume_en.pdf
//               typst compile resume.typ --input lang=ru resume_ru.pdf

#import "i18n.typ": translations, t

// Get language from CLI input or default to English
#let lang = sys.inputs.at("lang", default: "en")

// Personal info (shared across languages)
#let personal = (
  name-en: "Roman Vassilchenko",
  name-ru: "Роман Васильченко",
  phone: "+7 775 900-46-26",
  email: "roman.vassilchenko.work@gmail.com",
  github: "github.com/RomanVassilchenko",
  linkedin: "linkedin.com/in/rovassilchenko",
  telegram: "t.me/Roman_Vassilchenko",
)

// Colors
#let accent = rgb(34, 197, 94)
#let dark-gray = rgb(55, 65, 81)
#let light-gray = rgb(107, 114, 128)
#let bg-gray = rgb(243, 244, 246)

// Document setup
#set document(
  title: if lang == "en" { "Roman Vassilchenko - Go Backend Developer" } else { "Роман Васильченко - Go Backend Разработчик" },
  author: if lang == "en" { "Roman Vassilchenko" } else { "Роман Васильченко" },
)

#set page(
  paper: "a4",
  margin: 1.5cm,
  numbering: none,
)

#set text(
  font: "Inter",
  size: 11pt,
  fill: dark-gray,
  lang: lang,
)

#set par(
  justify: false,
  leading: 0.65em,
)

#set list(
  indent: 1.5em,
  body-indent: 0.5em,
  spacing: 0.4em,
)

// Helper function for translation
#let tr(key) = t(key, lang: lang)

// Section title with accent underline
#let section-title(title) = {
  v(0.5em)
  text(weight: "bold", size: 12pt)[#title]
  v(0.1em)
  line(length: 100%, stroke: 2pt + accent)
  v(0.3em)
}

// Tech stack badge
#let tech-stack-badge() = {
  box(fill: bg-gray, inset: (x: 4pt, y: 2pt), radius: 2pt)[
    #text(weight: "bold", size: 9pt)[#tr("tech-stack")]
  ]
}

// Job entry
#let job-entry(title, company, date, subtitle, items, stack) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(title)] + [ ] + emph(company),
    text(weight: "bold", fill: accent)[#date]
  )
  if subtitle != none {
    text(size: 9pt, fill: light-gray)[#subtitle]
  }
  v(0.2em)
  for item in items {
    [- #item]
  }
  v(0.15em)
  tech-stack-badge()
  h(4pt)
  text(size: 10pt)[#stack]
}

// Education entry
#let edu-entry(title, school, date, items) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(title)] + [ ] + emph(school),
    text(weight: "bold", fill: accent)[#date]
  )
  v(0.2em)
  for item in items {
    [- #item]
  }
}

// Project entry
#let project-entry(role, name, date, items, stack) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(role)] + [ ] + emph(name),
    text(weight: "bold", fill: accent)[#date]
  )
  v(0.2em)
  for item in items {
    [- #item]
  }
  v(0.15em)
  tech-stack-badge()
  h(4pt)
  text(size: 10pt)[#stack]
}

// === DOCUMENT CONTENT ===

// Header - compact two-column layout
#{
  set par(leading: 0.5em)
  grid(
    columns: (5.5cm, 1fr),
    gutter: 0.7cm,
    // Left column: badge, name, contacts
    align(top)[
      #box(fill: accent, inset: (x: 5pt, y: 2pt), radius: 2pt)[
        #text(fill: white, weight: "bold", size: 8pt)[#tr("job-title")]
      ]
      #v(0.3em)
      #text(weight: "bold", size: 22pt, tracking: -0.3pt)[
        #if lang == "en" { personal.name-en } else { personal.name-ru }
      ]
      #v(0.4em)
      #text(size: 9pt)[
        #personal.phone \
        #link("mailto:" + personal.email)[#personal.email] \
        #link("https://" + personal.github)[#personal.github] \
        #link("https://" + personal.linkedin)[#personal.linkedin] \
        #link("https://" + personal.telegram)[#personal.telegram]
      ]
    ],
    // Right column: summary
    align(top)[
      #v(0.5em)
      #text(size: 10pt)[#tr("summary")]
    ],
  )
}

// Key Skills
#section-title(tr("key-skills"))
#tech-stack-badge()
#h(4pt)
#text(size: 10pt)[#tr("skills-text")]

// Work Experience
#section-title(tr("work-experience"))

// Bereke Bank
#{
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(tr("bereke-title"))] + [ ] + emph(tr("bereke-company")),
    text(weight: "bold", fill: accent)[#tr("bereke-date")]
  )
  text(size: 9pt, fill: light-gray)[#tr("bereke-subtitle")]
  v(0.2em)
  if lang == "en" {
    [- Developing and maintaining *B2C loan-request microservices* for auto dealership credit processing.]
    [- Actively working with *Camunda BPMN workflows* for complex business process automation.]
    [- Implemented *multiple integrations* with various teams and services via API/Kafka.]
    [- Created *Mattermost integration* for alerts and notifications across banking operations.]
    [- Participated in digital transformation initiatives of core banking services.]
  } else {
    [- Разрабатываю и поддерживаю *B2C микросервисы кредитных заявок* для обработки автокредитов через дилерские центры.]
    [- Активно работаю с *Camunda BPMN workflows* для автоматизации сложных бизнес-процессов.]
    [- Реализовывал *множество интеграций* с разными командами и сервисами по API/Kafka.]
    [- Создал *интеграцию с Mattermost* для алертов и уведомлений по банковским операциям.]
    [- Участвовал в инициативах цифровой трансформации основных банковских сервисов.]
  }
  v(0.15em)
  tech-stack-badge()
  h(4pt)
  text(size: 10pt)[#tr("bereke-stack")]
}

#v(0.4em)

// Ozon Junior
#{
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(tr("ozon-jr-title"))] + [ ] + emph(tr("ozon-jr-company")),
    text(weight: "bold", fill: accent)[#tr("ozon-jr-date")]
  )
  text(size: 9pt, fill: light-gray)[#tr("ozon-jr-subtitle")]
  v(0.2em)
  if lang == "en" {
    [- Led monolith decomposition: extracted employee data into standalone service, reducing core load by *20–25%*.]
    [- Developed *staff-lib* — reusable library for DB access, validation, and middleware — adopted across dozens of services.]
    [- Automated attendance enforcement: reclaiming unused seats and blocking repeat no-shows.]
    [- Built data export pipeline from Ozon Forms to Vertica for analytics teams.]
  } else {
    [- Провёл декомпозицию монолита: вынес данные сотрудников в отдельный сервис, снизив нагрузку на ядро на *20–25%*.]
    [- Разработал *staff-lib* — переиспользуемую библиотеку для работы с БД, валидации и middleware — внедрена в десятках сервисов.]
    [- Автоматизировал контроль посещаемости: освобождение неиспользуемых мест и блокировка повторных неявок.]
    [- Реализовал конвейер экспорта данных из Ozon Forms в Vertica для аналитических команд.]
  }
  v(0.15em)
  tech-stack-badge()
  h(4pt)
  text(size: 10pt)[#tr("ozon-jr-stack")]
}

#v(0.4em)

// Ozon Intern
#{
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(tr("ozon-intern-title"))] + [ ] + emph(tr("ozon-intern-company")),
    text(weight: "bold", fill: accent)[#tr("ozon-intern-date")]
  )
  text(size: 9pt, fill: light-gray)[#tr("ozon-intern-subtitle")]
  v(0.2em)
  if lang == "en" {
    [- Optimized complex SQL queries, accelerating candidate list generation by up to *8×*.]
    [- Re-engineered ElasticSearch filter logic — improved speed *2.5×* and reduced cluster load.]
    [- Integrated Chatzone (Mattermost) via dedicated gRPC notification service with sharding and delayed Kafka dispatch — cut manager response time to applications.]
    [- Designed Grafana dashboards for proactive error monitoring — boosted anomaly detection and response speed.]
  } else {
    [- Оптимизировал сложные SQL-запросы, ускорив генерацию списков кандидатов до *8×*.]
    [- Переработал логику фильтров ElasticSearch — улучшил скорость в *2.5×* и снизил нагрузку на кластер.]
    [- Интегрировал Chatzone (Mattermost) через выделенный gRPC-сервис уведомлений с шардированием и отложенной отправкой через Kafka — сократил время ответа менеджеров на заявки.]
    [- Спроектировал Grafana-дашборды для проактивного мониторинга ошибок — повысил скорость обнаружения и реагирования на аномалии.]
  }
  v(0.15em)
  tech-stack-badge()
  h(4pt)
  text(size: 10pt)[#tr("ozon-intern-stack")]
}

// Education
#section-title(tr("education"))

#edu-entry(
  tr("edu-masters-title"),
  tr("edu-masters-school"),
  tr("edu-masters-date"),
  (tr("edu-masters-item"),),
)

#v(0.25em)

#{
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(tr("edu-bachelors-title"))] + [ ] + emph(tr("edu-bachelors-school")),
    text(weight: "bold", fill: accent)[#tr("edu-bachelors-date")]
  )
  v(0.2em)
  if lang == "en" {
    [- *Relevant Coursework:* Graph Theory Methods in Information Systems (Neo4j + GDS), Advanced Database Systems (PostgreSQL optimization), NoSQL Systems (MongoDB + FastAPI).]
  } else {
    [- *Ключевые курсы:* Методы теории графов в информационных системах (Neo4j + GDS), Продвинутые системы баз данных (оптимизация PostgreSQL), NoSQL-системы (MongoDB + FastAPI).]
  }
}

#v(0.25em)

#edu-entry(
  tr("edu-prev-title"),
  tr("edu-prev-school"),
  tr("edu-prev-date"),
  (tr("edu-prev-item"),),
)

// Two columns for Additional and Languages
#v(0.2em)
#grid(
  columns: (48%, 48%),
  column-gutter: 4%,
  [
    #section-title(tr("additional"))
    - #tr("additional-item-1")
    - #tr("additional-item-2")
    - #tr("additional-item-3")
  ],
  [
    #section-title(tr("languages"))
    - #tr("lang-russian")
    - #tr("lang-english")
    - #tr("lang-kazakh")
  ]
)

// Key Projects
#section-title(tr("key-projects"))

#project-entry(
  tr("project-title"),
  tr("project-name"),
  tr("project-date"),
  (
    tr("project-item-1"),
    tr("project-item-2"),
  ),
  tr("project-stack"),
)
