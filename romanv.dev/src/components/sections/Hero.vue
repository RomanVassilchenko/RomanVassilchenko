<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { ArrowDown, ArrowUpRight, Download, Mail, MapPin } from 'lucide-vue-next'
import Button from '../ui/Button.vue'

const { t, locale } = useI18n()

const metrics = ['issuance', 'adoption', 'search'] as const
const socialLinks = [
  { name: 'GitHub', url: 'https://github.com/RomanVassilchenko' },
  { name: 'LinkedIn', url: 'https://www.linkedin.com/in/rovassilchenko/' },
  { name: 'Telegram', url: 'https://t.me/Roman_Vassilchenko' },
]
</script>

<template>
  <section id="hero" class="relative overflow-hidden border-b border-border pt-16">
    <div class="editor-grid pointer-events-none absolute inset-0" aria-hidden="true"></div>
    <div
      class="page-shell relative flex min-h-[calc(100svh-4rem)] flex-col justify-center py-16 sm:py-20"
    >
      <div class="grid items-center gap-12 lg:grid-cols-[minmax(0,1fr)_18rem] lg:gap-20">
        <div class="animate-hero-in">
          <h1
            class="text-balance text-4xl font-semibold tracking-[-0.045em] text-foreground sm:text-5xl lg:text-[4rem] lg:leading-[1.06]"
          >
            {{ t('hero.headline') }}
          </h1>

          <p class="mt-6 max-w-2xl text-lg leading-8 text-muted-foreground sm:text-xl">
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
            <Button as="a" href="#contact" variant="outline" size="lg" class="gap-2">
              <Mail class="h-4 w-4" />
              {{ t('hero.cta.contact') }}
            </Button>
            <Button
              as="a"
              href="#projects"
              variant="ghost"
              size="lg"
              class="gap-2 text-muted-foreground"
            >
              {{ t('hero.cta.projects') }}
              <ArrowDown class="h-4 w-4" />
            </Button>
          </div>
        </div>

        <aside
          class="animate-hero-in-delayed mx-auto w-full max-w-xs lg:mx-0"
          :aria-label="t('hero.profileLabel')"
        >
          <div class="relative border border-border bg-card p-3">
            <div class="absolute -left-px -top-px h-8 w-1 bg-primary" aria-hidden="true"></div>
            <img
              src="/images/roman-vassilchenko.png?v=2"
              alt="Roman Vassilchenko"
              width="288"
              height="288"
              fetchpriority="high"
              decoding="async"
              class="aspect-square w-full object-cover grayscale-[15%]"
            />
            <div class="border-t border-border px-1 pb-1 pt-4">
              <p class="text-lg font-semibold text-foreground">{{ t('hero.name') }}</p>
              <p class="mt-1 font-mono text-xs text-primary">{{ t('hero.role') }}</p>
              <p class="mt-3 flex items-center gap-2 text-sm text-muted-foreground">
                <MapPin class="h-4 w-4" />
                {{ t('hero.location') }}
              </p>
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

      <div class="mt-16 grid border-y border-border bg-background/70 sm:grid-cols-3 lg:mt-20">
        <a
          v-for="(metric, index) in metrics"
          :key="metric"
          :href="t(`hero.metrics.${metric}.href`)"
          class="group relative px-5 py-6 transition-colors hover:bg-accent sm:px-6"
          :class="index > 0 ? 'border-t border-border sm:border-l sm:border-t-0' : ''"
        >
          <p
            class="font-mono text-3xl font-semibold tracking-[-0.04em] text-foreground group-hover:text-primary"
          >
            {{ t(`hero.metrics.${metric}.value`) }}
          </p>
          <p class="mt-1 text-sm font-medium text-foreground">
            {{ t(`hero.metrics.${metric}.label`) }}
          </p>
          <p class="mt-1 text-xs leading-5 text-muted-foreground">
            {{ t(`hero.metrics.${metric}.detail`) }}
          </p>
        </a>
      </div>
    </div>
  </section>
</template>
