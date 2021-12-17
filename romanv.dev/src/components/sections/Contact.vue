<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { Mail, Send, Linkedin, Github } from 'lucide-vue-next'
import Card from '../ui/Card.vue'

const { t } = useI18n()

const contactLinks = [
  {
    key: 'email',
    url: 'mailto:roman.vassilchenko.work@gmail.com',
    value: 'roman.vassilchenko.work@gmail.com',
    icon: Mail,
    color: 'hover:bg-red-500/10 hover:border-red-500/50 hover:text-red-500',
  },
  {
    key: 'telegram',
    url: 'https://t.me/Roman_Vassilchenko',
    value: '@Roman_Vassilchenko',
    icon: Send,
    color: 'hover:bg-blue-500/10 hover:border-blue-500/50 hover:text-blue-500',
  },
  {
    key: 'linkedin',
    url: 'https://www.linkedin.com/in/rovassilchenko/',
    value: 'in/rovassilchenko',
    icon: Linkedin,
    color: 'hover:bg-[#0A66C2]/10 hover:border-[#0A66C2]/50 hover:text-[#0A66C2]',
  },
  {
    key: 'github',
    url: 'https://github.com/RomanVassilchenko',
    value: 'RomanVassilchenko',
    icon: Github,
    color: 'hover:bg-gray-500/10 hover:border-gray-500/50',
  },
]
</script>

<template>
  <section id="contact" class="px-4 py-20">
    <div class="container mx-auto max-w-3xl text-center">
      <!-- Section Title -->
      <h2 class="mb-4 text-3xl font-bold md:text-4xl">
        {{ t('contact.title') }}
      </h2>
      <div class="mx-auto mb-6 h-1 w-20 rounded-full bg-primary"></div>

      <!-- Subtitle -->
      <p class="mb-12 text-lg text-muted-foreground">
        {{ t('contact.subtitle') }}
      </p>

      <!-- Contact links -->
      <div class="mb-12 grid gap-4 sm:grid-cols-2">
        <a
          v-for="link in contactLinks"
          :key="link.key"
          :href="link.url"
          target="_blank"
          class="block"
        >
          <Card
            :class="[
              'flex cursor-pointer items-center gap-4 border-2 p-5 transition-all',
              link.color,
            ]"
          >
            <div class="rounded-lg bg-muted p-2">
              <component :is="link.icon" class="h-5 w-5" />
            </div>
            <div class="text-left">
              <p class="text-sm text-muted-foreground">
                {{ t(`contact.${link.key}`) }}
              </p>
              <p class="font-medium text-foreground">
                {{ link.value }}
              </p>
            </div>
          </Card>
        </a>
      </div>
    </div>
  </section>
</template>
