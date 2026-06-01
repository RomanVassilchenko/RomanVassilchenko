<script setup lang="ts">
import { useI18n } from 'vue-i18n'

const { t } = useI18n()

const techCategories = [
  {
    key: 'languages',
    items: [
      { name: 'Go', color: '#00ADD8' },
      { name: 'GraphQL', color: '#E10098' },
      { name: 'Protobuf', color: '#FFCA28' },
    ],
  },
  {
    key: 'databases',
    items: [
      { name: 'PostgreSQL', color: '#4169E1' },
      { name: 'ClickHouse', color: '#FFCC01' },
      { name: 'Redis', color: '#DC382D' },
      { name: 'ElasticSearch', color: '#005571' },
      { name: 'Vertica', color: '#0073C6' },
      { name: 'MinIO', color: '#C72E49' },
    ],
  },
  {
    key: 'messaging',
    items: [
      { name: 'Apache Kafka', color: '#231F20' },
      { name: 'Camunda', color: '#FC5D0D' },
    ],
  },
  {
    key: 'monitoring',
    items: [
      { name: 'Grafana', color: '#F46800' },
      { name: 'Prometheus', color: '#E6522C' },
    ],
  },
  {
    key: 'devops',
    items: [
      { name: 'Docker', color: '#2496ED' },
      { name: 'Git', color: '#F05032' },
      { name: 'Linux', color: '#FCC624' },
      { name: 'NixOS', color: '#5277C3' },
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
                <span class="h-3 w-3 rounded-full" :style="{ backgroundColor: tech.color }"></span>
                <span class="text-sm font-medium">{{ tech.name }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
