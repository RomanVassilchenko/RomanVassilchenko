import { readFile, mkdir } from 'node:fs/promises'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { chromium } from 'playwright'
import { personal, resumes } from './data.mjs'

const directory = path.dirname(fileURLToPath(import.meta.url))
const [lang = 'en', outputArg, showMastersArg = 'false'] = process.argv.slice(2)

if (!['en', 'ru'].includes(lang)) throw new Error(`Unsupported resume language: ${lang}`)

const output = path.resolve(directory, outputArg ?? `../public/documents/resume_${lang}.pdf`)
const showMasters = showMastersArg === 'true'
const data = resumes[lang]
const css = await readFile(path.join(directory, 'resume.css'), 'utf8')

const escapeHtml = (value) =>
  String(value)
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')

const techList = (items) =>
  `<div class="tech-list">${items.map((item) => `<span>${escapeHtml(item)}</span>`).join('')}</div>`

const sectionHeading = (index, title) => `
  <div class="section-heading">
    <span class="section-index">${index}</span>
    <h2>${escapeHtml(title)}</h2>
  </div>`

const job = (entry) => `
  <article class="one-page-job">
    <div class="job-meta">
      <h3 class="job-company">${escapeHtml(entry.company)}</h3>
      <div class="job-period">${escapeHtml(entry.period)}</div>
      <div class="job-role">${escapeHtml(entry.role)}</div>
      <div class="job-context">${escapeHtml(entry.context)}</div>
    </div>
    <div class="job-body">
      <ul class="achievement-list">${entry.items.map((item) => `<li>${item}</li>`).join('')}</ul>
      ${techList(entry.stack)}
    </div>
  </article>`

const contactGroup = (items) => `
  <div class="contact-group">
    ${items
      .map(
        ({ label, value, href }) => `
          <div class="contact-item">
            <span class="contact-label">${escapeHtml(label)}</span>
            <a class="contact-value" href="${escapeHtml(href)}">${escapeHtml(value)}</a>
          </div>`
      )
      .join('')}
  </div>`

const education = data.education.filter((item) => showMasters || !item.masters)
const labels =
  lang === 'ru'
    ? {
        phone: 'Телефон',
        email: 'Почта',
        website: 'Сайт',
        github: 'GitHub',
        linkedin: 'LinkedIn',
        telegram: 'Telegram',
      }
    : {
        phone: 'Phone',
        email: 'Email',
        website: 'Website',
        github: 'GitHub',
        linkedin: 'LinkedIn',
        telegram: 'Telegram',
      }

const contacts = [
  [
    { label: labels.email, value: personal.email, href: `mailto:${personal.email}` },
    {
      label: labels.phone,
      value: personal.phone,
      href: `tel:${personal.phone.replaceAll(' ', '')}`,
    },
  ],
  [
    { label: labels.website, value: personal.website, href: `https://${personal.website}` },
    { label: labels.github, value: personal.github, href: `https://${personal.github}` },
  ],
  [
    { label: labels.linkedin, value: personal.linkedin, href: `https://${personal.linkedin}` },
    { label: labels.telegram, value: personal.telegram, href: `https://${personal.telegram}` },
  ],
]

const html = `<!doctype html>
<html lang="${lang}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${escapeHtml(data.name)} · ${escapeHtml(data.role)}</title>
  <style>${css}</style>
</head>
<body>
  <section class="page">
    <div class="page-inner">
      <header class="masthead">
        <div>
          <h1 class="name">${escapeHtml(data.name)}</h1>
          <div class="role-line">
            <span class="role">${escapeHtml(data.role)}</span>
            <span>${escapeHtml(data.location)}</span>
          </div>
        </div>
        <div class="summary-block">
          <p>${escapeHtml(data.summary)}</p>
        </div>
      </header>

      <div class="contact-strip" aria-label="${escapeHtml(data.labels.contacts)}">
        ${contacts.map(contactGroup).join('')}
      </div>

      <div class="one-page-grid">
        <main class="one-page-main">
          ${sectionHeading('01', data.labels.experience)}
          ${data.experience.map(job).join('')}
        </main>

        <aside class="side-panel">
          <section class="side-section">
            <h2 class="side-title">${escapeHtml(data.labels.impact)}</h2>
            ${data.metrics
              .map(
                (metric) => `
                  <div class="side-metric">
                    <span class="side-metric-value">${escapeHtml(metric.value)}</span>
                    <span class="side-metric-copy"><strong>${escapeHtml(metric.label)}</strong><small>${escapeHtml(metric.note)}</small></span>
                  </div>`
              )
              .join('')}
          </section>

          <section class="side-section project-side">
            <div class="project-role">${escapeHtml(data.project.role)}</div>
            <h2 class="project-name">${escapeHtml(data.project.name)}</h2>
            <p class="project-subtitle">${escapeHtml(data.project.subtitle)}</p>
            <ul class="project-list">${data.project.items.map((item) => `<li>${item}</li>`).join('')}</ul>
            ${techList(data.project.stack)}
          </section>

          <section class="side-section">
            <h2 class="side-title">${escapeHtml(data.labels.toolkit)}</h2>
            ${data.skills
              .map(
                (skill) => `
                  <div class="skill">
                    <div class="skill-label">${escapeHtml(skill.label)}</div>
                    <div class="skill-value">${escapeHtml(skill.value)}</div>
                  </div>`
              )
              .join('')}
          </section>

          <section class="side-section two-column-side">
            <div>
              <h2 class="side-title">${escapeHtml(data.labels.education)}</h2>
              ${education
                .map(
                  (item) => `
                    <div class="education-item">
                      <div class="education-degree">${escapeHtml(item.degree)}</div>
                      <div class="education-school">${escapeHtml(item.school)}</div>
                      <div class="education-period">${escapeHtml(item.period)}</div>
                      ${item.note ? `<div class="education-note">${escapeHtml(item.note)}</div>` : ''}
                    </div>`
                )
                .join('')}
            </div>
            <div>
              <h2 class="side-title">${escapeHtml(data.labels.languages)}</h2>
              <ul class="simple-list">${data.languages.map((item) => `<li>${escapeHtml(item)}</li>`).join('')}</ul>
              <h2 class="side-title availability-title">${escapeHtml(data.labels.additional)}</h2>
              <ul class="simple-list">${data.additional.map((item) => `<li>${escapeHtml(item)}</li>`).join('')}</ul>
            </div>
          </section>
        </aside>
      </div>
    </div>
    <footer class="footer"><span>romanv.dev · ${personal.email}</span><span class="page-number">01 / 01</span></footer>
  </section>
</body>
</html>`

await mkdir(path.dirname(output), { recursive: true })
const browser = await chromium.launch({ headless: true })
try {
  const page = await browser.newPage({
    viewport: { width: 1200, height: 1697 },
    deviceScaleFactor: 1,
  })
  await page.setContent(html, { waitUntil: 'networkidle' })
  await page.emulateMedia({ media: 'print' })
  await page.evaluate(() => document.fonts.ready)

  const overflow = await page.evaluate(() =>
    ['.page', '.one-page-grid', '.one-page-main', '.side-panel'].flatMap((selector) =>
      [...document.querySelectorAll(selector)]
        .filter(
          (element) =>
            element.scrollHeight > element.clientHeight + 1 ||
            element.scrollWidth > element.clientWidth + 1
        )
        .map((element) => ({
          selector,
          client: [element.clientWidth, element.clientHeight],
          scroll: [element.scrollWidth, element.scrollHeight],
        }))
    )
  )

  if (overflow.length > 0) {
    throw new Error(`Resume layout overflow: ${JSON.stringify(overflow)}`)
  }

  await page.pdf({
    path: output,
    printBackground: true,
    preferCSSPageSize: true,
    margin: { top: 0, right: 0, bottom: 0, left: 0 },
  })

  if (process.env.RESUME_SCREENSHOT_DIR) {
    await mkdir(process.env.RESUME_SCREENSHOT_DIR, { recursive: true })
    await page.emulateMedia({ media: 'screen' })
    await page.screenshot({
      path: path.join(process.env.RESUME_SCREENSHOT_DIR, `resume_${lang}.png`),
      fullPage: true,
    })
  }
} finally {
  await browser.close()
}

console.log(`Generated ${output}`)
