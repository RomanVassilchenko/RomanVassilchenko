<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { ArrowUpRight, Github, Linkedin, Mail, Send } from 'lucide-vue-next'
import Button from '../ui/Button.vue'

const { t } = useI18n()
const contactLinks = [
  {
    key: 'email',
    url: 'mailto:roman.vassilchenko.work@gmail.com',
    value: 'roman.vassilchenko.work@gmail.com',
    icon: Mail,
  },
  {
    key: 'linkedin',
    url: 'https://www.linkedin.com/in/rovassilchenko/',
    value: 'in/rovassilchenko',
    icon: Linkedin,
  },
  {
    key: 'github',
    url: 'https://github.com/RomanVassilchenko',
    value: 'RomanVassilchenko',
    icon: Github,
  },
]
</script>

<template>
  <section id="contact" class="section-shell">
    <div class="page-shell">
      <div
        class="relative overflow-hidden rounded-[1.5rem] border border-border bg-card px-6 py-10 text-foreground shadow-sm sm:px-10 sm:py-14 lg:px-14 lg:py-16"
      >
        <div class="absolute right-0 top-0 h-full w-1 bg-primary" aria-hidden="true"></div>
        <div class="grid gap-10 lg:grid-cols-[minmax(0,1fr)_19rem] lg:items-end lg:gap-16">
          <div>
            <p class="section-kicker">{{ t('contact.kicker') }}</p>
            <h2
              class="max-w-4xl text-balance text-3xl font-semibold tracking-[-0.04em] text-foreground sm:text-4xl lg:text-5xl"
            >
              {{ t('contact.title') }}
            </h2>
            <p class="mt-5 max-w-2xl text-base leading-7 text-muted-foreground sm:text-lg">
              {{ t('contact.subtitle') }}
            </p>
            <Button
              as="a"
              href="https://t.me/Roman_Vassilchenko"
              target="_blank"
              rel="noopener noreferrer"
              size="lg"
              class="mt-8 gap-2"
            >
              <Send class="h-4 w-4" />
              {{ t('contact.primaryCta') }}
            </Button>
          </div>

          <div class="border-t border-border pt-5 lg:border-l lg:border-t-0 lg:pl-8 lg:pt-0">
            <p class="mb-3 font-mono text-[11px] uppercase tracking-[0.14em] text-muted-foreground">
              {{ t('contact.otherChannels') }}
            </p>
            <a
              v-for="link in contactLinks"
              :key="link.key"
              :href="link.url"
              target="_blank"
              rel="noopener noreferrer"
              class="group flex min-h-12 items-center gap-3 border-b border-border text-sm text-muted-foreground transition-colors hover:text-foreground"
            >
              <component :is="link.icon" class="h-4 w-4" />
              <span class="min-w-0 flex-1 truncate">{{ link.value }}</span>
              <ArrowUpRight
                class="h-4 w-4 transition-transform group-hover:-translate-y-0.5 group-hover:translate-x-0.5"
              />
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
