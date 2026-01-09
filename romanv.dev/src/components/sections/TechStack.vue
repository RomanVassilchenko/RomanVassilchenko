<script setup lang="ts">
import { useI18n } from 'vue-i18n'

const { t } = useI18n()

const techCategories = [
  {
    key: 'languages',
    items: [
      { name: 'Go', icon: 'go', color: '#00ADD8' },
      { name: 'GraphQL', icon: 'graphql', color: '#E10098' },
      { name: 'Protobuf', color: '#FFCA28' },
    ],
  },
  {
    key: 'databases',
    items: [
      { name: 'PostgreSQL', icon: 'postgresql', color: '#4169E1' },
      { name: 'Redis', icon: 'redis', color: '#DC382D' },
      { name: 'ElasticSearch', icon: 'elasticsearch', color: '#005571' },
      { name: 'Vertica', color: '#0073C6' },
      { name: 'MinIO', icon: 'minio', color: '#C72E49' },
    ],
  },
  {
    key: 'messaging',
    items: [
      { name: 'Apache Kafka', icon: 'apachekafka', color: '#231F20' },
      { name: 'Camunda', icon: 'camunda', color: '#FC5D0D' },
    ],
  },
  {
    key: 'monitoring',
    items: [
      { name: 'Grafana', icon: 'grafana', color: '#F46800' },
      { name: 'Prometheus', icon: 'prometheus', color: '#E6522C' },
    ],
  },
  {
    key: 'devops',
    items: [
      { name: 'Docker', icon: 'docker', color: '#2496ED' },
      { name: 'Git', icon: 'git', color: '#F05032' },
      { name: 'Linux', icon: 'linux', color: '#FCC624' },
      { name: 'NixOS', icon: 'nixos', color: '#5277C3' },
    ],
  },
]
</script>

<template>
  <section id="skills" class="bg-muted/30 px-4 py-20">
    <div class="container mx-auto max-w-5xl">
      <!-- Section Title -->
      <h2 class="mb-4 text-center text-3xl font-bold md:text-4xl">
        {{ t('skills.title') }}
      </h2>
      <div class="mx-auto mb-12 h-1 w-20 rounded-full bg-primary"></div>

      <!-- Tech categories -->
      <div class="space-y-10">
        <div v-for="category in techCategories" :key="category.key">
          <h3 class="mb-6 text-center text-lg font-semibold text-muted-foreground">
            {{ t(`skills.categories.${category.key}`) }}
          </h3>
          <div class="flex flex-wrap justify-center gap-3">
            <div v-for="tech in category.items" :key="tech.name" class="group relative">
              <div
                class="flex cursor-default items-center gap-2 rounded-lg border border-border bg-card px-4 py-2 transition-all hover:border-primary/50"
              >
                <!-- Simple Icons CDN -->
                <img
                  v-if="tech.icon"
                  :src="`https://cdn.simpleicons.org/${tech.icon}/${tech.color?.replace('#', '')}`"
                  :alt="tech.name"
                  class="h-4 w-4"
                />
                <!-- Color dot fallback for items without icons -->
                <div
                  v-else-if="tech.color"
                  class="h-3 w-3 rounded-full"
                  :style="{ backgroundColor: tech.color }"
                ></div>
                <!-- Default fallback -->
                <span v-else class="h-3 w-3 rounded-full bg-primary"></span>
                <span class="text-sm font-medium">{{ tech.name }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
