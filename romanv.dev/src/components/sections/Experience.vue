<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { Building2, Calendar, ChevronRight } from 'lucide-vue-next'
import Card from '../ui/Card.vue'
import Badge from '../ui/Badge.vue'

const { t, tm } = useI18n()

const positions = ['bereke', 'ozonStaff', 'ozonIntern'] as const
</script>

<template>
  <section id="experience" class="px-4 py-20">
    <div class="container mx-auto max-w-4xl">
      <!-- Section Title -->
      <h2 class="mb-4 text-center text-3xl font-bold md:text-4xl">
        {{ t('experience.title') }}
      </h2>
      <div class="mx-auto mb-12 h-1 w-20 rounded-full bg-primary"></div>

      <div class="space-y-6">
        <Card
          v-for="position in positions"
          :key="position"
          class="p-6 transition-colors hover:border-primary/50"
        >
          <div class="grid gap-5 md:grid-cols-[minmax(0,1fr)_auto]">
            <div>
              <!-- Company & Role -->
              <div class="mb-3 flex items-start gap-3">
                <div class="shrink-0 rounded-lg bg-primary/10 p-2">
                  <Building2 class="h-5 w-5 text-primary" />
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-foreground">
                    {{ t(`experience.positions.${position}.company`) }}
                  </h3>
                  <p class="font-medium text-primary">
                    {{ t(`experience.positions.${position}.role`) }}
                  </p>
                  <p class="text-sm text-muted-foreground">
                    {{ t(`experience.positions.${position}.team`) }}
                  </p>
                </div>
              </div>

              <!-- Period -->
              <div class="mb-4 flex items-center gap-1.5 text-sm text-muted-foreground md:hidden">
                <Calendar class="h-4 w-4" />
                {{ t(`experience.positions.${position}.period`) }}
              </div>

              <!-- Description -->
              <p class="mb-4 text-muted-foreground">
                {{ t(`experience.positions.${position}.description`) }}
              </p>

              <!-- Achievements -->
              <ul class="mb-4 space-y-2">
                <li
                  v-for="(achievement, i) in tm(
                    `experience.positions.${position}.achievements`
                  ) as string[]"
                  :key="i"
                  class="flex items-start gap-2 text-sm text-muted-foreground"
                >
                  <ChevronRight class="mt-0.5 h-4 w-4 shrink-0 text-primary" />
                  {{ achievement }}
                </li>
              </ul>

              <!-- Tech stack -->
              <div class="flex flex-wrap gap-2">
                <Badge
                  v-for="tech in tm(`experience.positions.${position}.tech`) as string[]"
                  :key="tech"
                >
                  {{ tech }}
                </Badge>
              </div>
            </div>

            <div
              class="hidden h-fit shrink-0 items-center gap-1.5 rounded-full bg-primary/10 px-3 py-1 text-sm font-medium text-primary md:flex"
            >
              <Calendar class="h-4 w-4" />
              {{ t(`experience.positions.${position}.period`) }}
            </div>
          </div>
        </Card>
      </div>
    </div>
  </section>
</template>
