<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { MapPin, Download, Mail } from 'lucide-vue-next'
import Button from '../ui/Button.vue'

const { t, locale } = useI18n()

const socialLinks = [
  {
    name: 'GitHub',
    url: 'https://github.com/RomanVassilchenko',
    icon: 'github',
  },
  {
    name: 'LinkedIn',
    url: 'https://www.linkedin.com/in/rovassilchenko/',
    icon: 'linkedin',
  },
  {
    name: 'Telegram',
    url: 'https://t.me/Roman_Vassilchenko',
    icon: 'telegram',
  },
]
</script>

<template>
  <section id="hero" class="flex min-h-screen items-center justify-center px-4 pb-12 pt-16">
    <div class="container mx-auto max-w-4xl">
      <div class="flex flex-col items-center gap-8 md:flex-row md:gap-12">
        <!-- Avatar -->
        <div class="relative flex-shrink-0">
          <div
            class="h-40 w-40 overflow-hidden rounded-full shadow-xl ring-4 ring-primary/20 md:h-48 md:w-48"
          >
            <img
              src="https://github.com/RomanVassilchenko.png"
              alt="Roman Vassilchenko"
              class="h-full w-full object-cover"
            />
          </div>
          <!-- Status indicator -->
          <div
            class="bg-green-500 absolute bottom-2 right-2 h-5 w-5 rounded-full border-4 border-background"
            title="Available for opportunities"
          ></div>
        </div>

        <!-- Content -->
        <div class="flex-1 text-center md:text-left">
          <!-- Greeting -->
          <p class="mb-2 text-lg text-muted-foreground">
            {{ t('hero.greeting') }}
          </p>

          <!-- Name -->
          <h1 class="mb-3 text-4xl font-bold text-foreground md:text-5xl lg:text-6xl">
            {{ t('hero.name') }}
          </h1>

          <!-- Title with gradient -->
          <h2 class="mb-4 text-2xl font-semibold text-primary md:text-3xl">
            {{ t('hero.title') }}
          </h2>

          <!-- Location & Current Work -->
          <div
            class="mb-6 flex flex-col items-center justify-center gap-3 text-sm text-muted-foreground sm:flex-row md:justify-start"
          >
            <span class="flex items-center gap-1.5">
              <MapPin class="h-4 w-4" />
              {{ t('hero.location') }}
            </span>
            <span class="hidden sm:block">•</span>
            <span>
              {{ t('hero.currentWork') }}
              <a
                href="https://berekebank.kz/ru/"
                target="_blank"
                class="font-medium text-primary hover:underline"
              >
                {{ t('hero.company') }}
              </a>
            </span>
          </div>

          <!-- CTA Buttons -->
          <div class="mb-6 flex flex-wrap items-center justify-center gap-3 md:justify-start">
            <Button as="a" :href="`/documents/resume_${locale}.pdf`" target="_blank" class="gap-2">
              <Download class="h-4 w-4" />
              {{ t('hero.cta.resume') }}
            </Button>
            <Button as="a" href="#contact" variant="outline" class="gap-2">
              <Mail class="h-4 w-4" />
              {{ t('hero.cta.contact') }}
            </Button>
          </div>

          <!-- Social Links -->
          <div class="flex items-center justify-center gap-4 md:justify-start">
            <a
              v-for="link in socialLinks"
              :key="link.name"
              :href="link.url"
              target="_blank"
              class="text-muted-foreground transition-colors hover:text-foreground"
              :title="link.name"
            >
              <svg
                v-if="link.icon === 'github'"
                class="h-6 w-6"
                fill="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"
                />
              </svg>
              <svg
                v-else-if="link.icon === 'linkedin'"
                class="h-6 w-6"
                fill="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"
                />
              </svg>
              <svg
                v-else-if="link.icon === 'telegram'"
                class="h-6 w-6"
                fill="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  d="M11.944 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 0 1 .171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z"
                />
              </svg>
            </a>
          </div>
        </div>
      </div>

      <!-- Scroll indicator -->
      <div class="absolute bottom-8 left-1/2 hidden -translate-x-1/2 transform md:block">
        <div
          class="flex h-10 w-6 justify-center rounded-full border-2 border-muted-foreground/30 pt-2"
        >
          <div class="h-1.5 w-1.5 animate-bounce rounded-full bg-muted-foreground/50"></div>
        </div>
      </div>
    </div>
  </section>
</template>
