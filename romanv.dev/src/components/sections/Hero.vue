<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { ArrowDown, ArrowUpRight, Download, MapPin } from 'lucide-vue-next'
import Button from '../ui/Button.vue'

const { t, locale } = useI18n()

const socialLinks = [
  { name: 'GitHub', url: 'https://github.com/RomanVassilchenko' },
  { name: 'LinkedIn', url: 'https://www.linkedin.com/in/rovassilchenko/' },
  { name: 'Telegram', url: 'https://t.me/Roman_Vassilchenko' },
]
</script>

<template>
  <section id="hero" class="relative overflow-hidden pt-16">
    <div class="editor-grid pointer-events-none absolute inset-0" aria-hidden="true"></div>
    <div
      class="page-shell relative flex min-h-[calc(100svh-4rem)] flex-col justify-center py-16 sm:py-20"
    >
      <div class="grid items-center gap-12 lg:grid-cols-[minmax(0,1.35fr)_21rem] lg:gap-24">
        <div class="animate-hero-in">
          <div
            class="mb-8 flex flex-wrap items-center gap-x-5 gap-y-2 font-mono text-xs text-muted-foreground"
          >
            <span class="inline-flex items-center gap-2 text-foreground">
              <span class="h-2 w-2 rounded-full bg-success"></span>
              {{ t('hero.current') }}
            </span>
            <span class="inline-flex items-center gap-1.5">
              <MapPin class="h-3.5 w-3.5" />
              {{ t('hero.location') }}
            </span>
          </div>
          <h1
            class="max-w-5xl text-balance text-5xl font-semibold tracking-[-0.065em] text-foreground sm:text-6xl lg:text-[5.35rem] lg:leading-[0.98]"
          >
            {{ t('hero.headline') }}
          </h1>

          <p class="mt-8 max-w-3xl text-lg leading-8 text-muted-foreground sm:text-xl">
            {{ t('hero.summary') }}
          </p>

          <div class="mt-8 flex flex-wrap gap-3">
            <Button
              as="a"
              :href="`/documents/resume_${locale}.pdf`"
              target="_blank"
              rel="noopener noreferrer"
              size="lg"
              class="gap-2"
            >
              <Download class="h-4 w-4" />
              {{ t('hero.cta.resume') }}
            </Button>
            <Button as="a" href="#projects" variant="outline" size="lg" class="gap-2">
              {{ t('hero.cta.projects') }}
              <ArrowDown class="h-4 w-4" />
            </Button>
          </div>
        </div>

        <aside
          class="animate-hero-in-delayed mx-auto w-full max-w-xs lg:mx-0"
          :aria-label="t('hero.profileLabel')"
        >
          <div
            class="relative rounded-[1.5rem] border border-border bg-card p-3 shadow-[0_20px_60px_-36px_hsl(var(--foreground)/0.3)]"
          >
            <div
              class="absolute -right-3 -top-3 rounded-full bg-accent px-3 py-2 font-mono text-[10px] font-semibold uppercase tracking-wider text-accent-foreground shadow-sm"
              aria-hidden="true"
            >
              Go / Fintech
            </div>
            <img
              src="/images/roman-vassilchenko.png?v=2"
              alt="Roman Vassilchenko"
              width="288"
              height="288"
              fetchpriority="high"
              decoding="async"
              class="aspect-square w-full rounded-[1.2rem] object-cover grayscale-[8%]"
            />
            <div class="px-2 pb-2 pt-5">
              <p class="text-lg font-semibold text-foreground">{{ t('hero.name') }}</p>
              <p class="mt-1 text-sm text-muted-foreground">{{ t('hero.role') }}</p>
            </div>
          </div>
          <div class="mt-3 flex flex-wrap gap-x-4 gap-y-2 px-1">
            <a
              v-for="link in socialLinks"
              :key="link.name"
              :href="link.url"
              target="_blank"
              rel="noopener noreferrer"
              class="inline-flex min-h-8 items-center gap-1 font-mono text-xs text-muted-foreground transition-colors hover:text-primary"
            >
              {{ link.name }}
              <ArrowUpRight class="h-3 w-3" />
            </a>
          </div>
        </aside>
      </div>
    </div>
  </section>
</template>
