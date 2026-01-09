<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { ExternalLink } from 'lucide-vue-next'

const { t } = useI18n()

const services = [
  {
    key: 'bitwarden',
    url: 'https://bitwarden.romanv.dev',
    color: '#175DDC', // Bitwarden blue
  },
  {
    key: 'joplin',
    url: 'https://joplin.romanv.dev',
    color: '#043872', // Joplin blue
  },
  {
    key: 'photos',
    url: 'https://photos.romanv.dev',
    color: '#4250AF', // Immich purple
  },
  {
    key: 'git',
    url: 'https://git.romanv.dev',
    color: '#FB923C', // Forgejo orange
  },
  {
    key: 'nixCache',
    url: 'https://nix-cache.romanv.dev',
    color: '#5277C3', // NixOS blue
  },
]
</script>

<template>
  <section id="services" class="bg-muted/30 px-4 py-20">
    <div class="container mx-auto max-w-5xl">
      <!-- Section Title -->
      <h2 class="mb-4 text-center text-3xl font-bold md:text-4xl">
        {{ t('services.title') }}
      </h2>
      <div class="mx-auto mb-6 h-1 w-20 rounded-full bg-primary"></div>

      <!-- NixOS note -->
      <p class="mx-auto mb-12 max-w-2xl text-center text-muted-foreground">
        {{ t('services.subtitle') }}
      </p>

      <!-- Services grid -->
      <div class="flex flex-wrap justify-center gap-4">
        <a
          v-for="service in services"
          :key="service.key"
          :href="service.url"
          target="_blank"
          rel="noopener noreferrer"
          class="group flex w-full items-center gap-4 rounded-lg border border-border bg-card p-4 transition-all hover:border-primary/50 hover:shadow-md sm:w-[calc(50%-0.5rem)] lg:w-[calc(33.333%-0.75rem)]"
        >
          <!-- Color dot -->
          <div
            class="h-4 w-4 shrink-0 rounded-full"
            :style="{ backgroundColor: service.color }"
          ></div>

          <!-- Text -->
          <div class="flex-1 min-w-0">
            <h3 class="font-semibold text-foreground group-hover:text-primary transition-colors">
              {{ t(`services.items.${service.key}.name`) }}
            </h3>
            <p class="text-sm text-muted-foreground truncate">
              {{ t(`services.items.${service.key}.description`) }}
            </p>
          </div>

          <!-- External link icon -->
          <ExternalLink
            class="h-4 w-4 shrink-0 text-muted-foreground opacity-0 transition-opacity group-hover:opacity-100"
          />
        </a>
      </div>
    </div>
  </section>
</template>
