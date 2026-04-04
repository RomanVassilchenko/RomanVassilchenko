// Resume template with localization support
// Compile with: typst compile resume.typ --input lang=en resume_en.pdf
//               typst compile resume.typ --input lang=ru resume_ru.pdf

#import "i18n.typ": translations, t
// Font Awesome 7 icon helpers (FA7 is installed locally)
#let fa-phone(size: 1em)    = text(font: "Font Awesome 7 Free Solid", size: size)[\u{f095}]
#let fa-envelope(size: 1em) = text(font: "Font Awesome 7 Free Solid", size: size)[\u{f0e0}]
#let fa-globe(size: 1em)    = text(font: "Font Awesome 7 Free Solid", size: size)[\u{f0ac}]
#let fa-github(size: 1em)   = text(font: "Font Awesome 7 Brands",     size: size)[\u{f09b}]
#let fa-linkedin(size: 1em) = text(font: "Font Awesome 7 Brands",     size: size)[\u{f0e1}]
#let fa-telegram(size: 1em) = text(font: "Font Awesome 7 Brands",     size: size)[\u{f2c6}]

// Get language from CLI input or default to English
#let lang = sys.inputs.at("lang", default: "en")

// Personal info (shared across languages)
#let personal = (
  name-en: "Roman Vassilchenko",
  name-ru: "Роман Васильченко",
  phone: "+7 775 900-46-26",
  email: "roman.vassilchenko.work@gmail.com",
  website: "romanv.dev",
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
  title: if lang == "en" { "Roman Vassilchenko - Go Backend Developer" } else { "Роман Васильченко - Go Backend разработчик" },
  author: if lang == "en" { "Roman Vassilchenko" } else { "Роман Васильченко" },
)

#set page(
  paper: "a4",
  margin: 1.25cm,
  numbering: none,
)

#set text(
  font: "Inter",
  size: 10.6pt,
  fill: dark-gray,
  lang: lang,
)

#set par(
  justify: false,
  leading: 0.6em,
)

#set list(
  indent: 1.35em,
  body-indent: 0.4em,
  spacing: 0.24em,
)

// Helper function for translation
#let tr(key) = t(key, lang: lang)

// Section title with accent underline
#let section-title(title) = {
  v(0.32em)
  text(weight: "bold", size: 11.5pt)[#title]
  v(0.06em)
  line(length: 100%, stroke: 1.7pt + accent)
  v(0.18em)
}

// Tech stack badge
#let tech-stack-badge() = {
  box(fill: bg-gray, inset: (x: 3.5pt, y: 1.5pt), radius: 2pt)[
    #text(weight: "bold", size: 8.5pt)[#tr("tech-stack")]
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
    text(size: 8.5pt, fill: light-gray)[#subtitle]
  }
  v(0.14em)
  for item in items {
    [- #item]
  }
  v(0.1em)
  tech-stack-badge()
  h(3pt)
  text(size: 9.4pt)[#stack]
}

// Education entry
#let edu-entry(title, school, date, items) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(title)] + [ ] + emph(school),
    text(weight: "bold", fill: accent)[#date]
  )
  v(0.14em)
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
  v(0.14em)
  for item in items {
    [- #item]
  }
  v(0.1em)
  tech-stack-badge()
  h(3pt)
  text(size: 9.4pt)[#stack]
}

// === DOCUMENT CONTENT ===

// Header - compact two-column layout
#{
  set par(leading: 0.44em)
  grid(
    columns: (6.6cm, 1fr),
    gutter: 0.55cm,
    // Left column: badge, name, contacts
    align(top)[
      #box(fill: accent, inset: (x: 5pt, y: 2pt), radius: 2pt)[
        #text(fill: white, weight: "bold", size: 7.5pt)[#tr("job-title")]
      ]
      #v(0.2em)
      #text(weight: "bold", size: 20.5pt, tracking: -0.3pt)[
        #if lang == "en" { personal.name-en } else { personal.name-ru }
      ]
      #v(0.26em)
      #text(size: 8.4pt)[
        #fa-phone(size: 8pt) #personal.phone \
        #fa-envelope(size: 8pt) #link("mailto:" + personal.email)[#personal.email] \
        #fa-globe(size: 8pt) #link("https://" + personal.website)[#personal.website] \
        #fa-github(size: 8pt) #link("https://" + personal.github)[#personal.github] \
        #fa-linkedin(size: 8pt) #link("https://" + personal.linkedin)[#personal.linkedin] \
        #fa-telegram(size: 8pt) #link("https://" + personal.telegram)[#personal.telegram]
      ]
    ],
    // Right column: tagline + key skills
    align(top)[
      #v(0.34em)
      #text(size: 9.2pt, style: "italic", fill: light-gray)[#tr("tagline")]
      #v(0.24em)
      #text(weight: "bold", size: 11.5pt)[#tr("key-skills")]
      #v(0.06em)
      #line(length: 100%, stroke: 1.7pt + accent)
      #v(0.18em)
      #tech-stack-badge()
      #h(3pt)
      #text(size: 9.25pt)[#tr("skills-text")]
    ],
  )
}

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
  text(size: 8.5pt, fill: light-gray)[#tr("bereke-subtitle")]
  v(0.14em)
  [- #tr("bereke-item-1")]
  [- #tr("bereke-item-2")]
  [- #tr("bereke-item-3")]
  [- #tr("bereke-item-4")]
  v(0.1em)
  tech-stack-badge()
  h(3pt)
  text(size: 9.4pt)[#tr("bereke-stack")]
}

#v(0.26em)

// Ozon Junior
#{
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(tr("ozon-jr-title"))] + [ ] + emph(tr("ozon-jr-company")),
    text(weight: "bold", fill: accent)[#tr("ozon-jr-date")]
  )
  text(size: 8.5pt, fill: light-gray)[#tr("ozon-jr-subtitle")]
  v(0.14em)
  [- #tr("ozon-jr-item-1")]
  [- #tr("ozon-jr-item-2")]
  [- #tr("ozon-jr-item-3")]
  [- #tr("ozon-jr-item-4")]
  [- #tr("ozon-jr-item-5")]
  [- #tr("ozon-jr-item-6")]
  v(0.1em)
  tech-stack-badge()
  h(3pt)
  text(size: 9.4pt)[#tr("ozon-jr-stack")]
}

#v(0.26em)

// Ozon Intern
#{
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(tr("ozon-intern-title"))] + [ ] + emph(tr("ozon-intern-company")),
    text(weight: "bold", fill: accent)[#tr("ozon-intern-date")]
  )
  text(size: 8.5pt, fill: light-gray)[#tr("ozon-intern-subtitle")]
  v(0.14em)
  [- #tr("ozon-intern-item-1")]
  [- #tr("ozon-intern-item-2")]
  [- #tr("ozon-intern-item-3")]
  [- #tr("ozon-intern-item-4")]
  v(0.1em)
  tech-stack-badge()
  h(3pt)
  text(size: 9.4pt)[#tr("ozon-intern-stack")]
}

// Education
#section-title(tr("education"))

#edu-entry(
  tr("edu-masters-title"),
  tr("edu-masters-school"),
  tr("edu-masters-date"),
  (tr("edu-masters-item"),),
)

#v(0.16em)

#{
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#upper(tr("edu-bachelors-title"))] + [ ] + emph(tr("edu-bachelors-school")),
    text(weight: "bold", fill: accent)[#tr("edu-bachelors-date")]
  )
}

#v(0.16em)

#edu-entry(
  tr("edu-prev-title"),
  tr("edu-prev-school"),
  tr("edu-prev-date"),
  (tr("edu-prev-item"),),
)

// Two columns for Additional and Languages
#v(0.12em)
#grid(
  columns: (48%, 48%),
  column-gutter: 3.5%,
  [
    #section-title(tr("additional"))
    - #tr("additional-item-1")
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
    tr("project-item-3"),
  ),
  tr("project-stack"),
)
