<script setup lang="ts">
import { useI18n } from 'vue-i18n'

const { t } = useI18n()

const techCategories = [
  { key: 'backend', items: ['Go', 'gRPC', 'REST', 'GraphQL', 'Protobuf'] },
  {
    key: 'data',
    items: ['PostgreSQL', 'ClickHouse', 'Redis', 'Elasticsearch', 'Vertica', 'MinIO'],
  },
  { key: 'distributed', items: ['Kafka', 'Camunda', 'Microservices', 'Event-driven'] },
  { key: 'operations', items: ['Docker', 'Linux', 'Grafana', 'Prometheus', 'Git'] },
]
</script>

<template>
  <section id="skills" class="section-shell">
    <div class="page-shell">
      <div class="grid gap-10 lg:grid-cols-[minmax(0,0.8fr)_minmax(0,1.2fr)] lg:gap-20">
        <div>
          <p class="section-kicker">{{ t('skills.kicker') }}</p>
          <h2 class="section-heading">{{ t('skills.title') }}</h2>
          <p class="section-copy">{{ t('skills.intro') }}</p>
        </div>

        <div class="overflow-hidden rounded-[1.5rem] border border-border bg-card shadow-sm">
          <div
            v-for="(category, index) in techCategories"
            :key="category.key"
            class="grid border-b border-border last:border-b-0 sm:grid-cols-[11rem_minmax(0,1fr)]"
          >
            <div class="border-b border-border bg-accent/35 p-5 sm:border-b-0 sm:border-r">
              <p class="font-mono text-[10px] text-primary">0{{ index + 1 }}</p>
              <h3 class="mt-2 text-sm font-semibold text-foreground">
                {{ t(`skills.categories.${category.key}`) }}
              </h3>
            </div>
            <div class="flex flex-wrap content-center gap-x-5 gap-y-3 p-5">
              <span
                v-for="tech in category.items"
                :key="tech"
                class="font-mono text-xs text-muted-foreground transition-colors hover:text-primary"
              >
                {{ tech }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
