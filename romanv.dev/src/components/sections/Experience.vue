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

      <!-- Timeline -->
      <div class="relative">
        <!-- Timeline line -->
        <div
          class="absolute bottom-0 left-0 top-0 hidden w-0.5 transform bg-border md:left-1/2 md:block md:-translate-x-px"
        ></div>

        <!-- Experience items -->
        <div class="space-y-8">
          <div
            v-for="(position, index) in positions"
            :key="position"
            :class="[
              'relative',
              index % 2 === 0 ? 'md:pr-[50%] md:text-right' : 'md:ml-auto md:pl-[50%]',
            ]"
          >
            <!-- Timeline dot -->
            <div
              :class="[
                'absolute top-6 hidden h-4 w-4 rounded-full border-4 border-background bg-primary shadow md:block',
                index % 2 === 0
                  ? 'right-0 md:left-1/2 md:right-auto md:-translate-x-1/2'
                  : 'left-0 md:left-1/2 md:-translate-x-1/2',
              ]"
            ></div>

            <Card :class="['p-6', index % 2 === 0 ? 'md:mr-8' : 'md:ml-8']">
              <!-- Company & Role -->
              <div
                :class="[
                  'mb-3 flex items-start gap-3',
                  index % 2 === 0 ? 'md:flex-row-reverse' : '',
                ]"
              >
                <div class="shrink-0 rounded-lg bg-primary/10 p-2">
                  <Building2 class="h-5 w-5 text-primary" />
                </div>
                <div :class="index % 2 === 0 ? 'md:text-right' : ''">
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
              <div
                :class="[
                  'mb-4 flex items-center gap-1.5 text-sm text-muted-foreground',
                  index % 2 === 0 ? 'md:justify-end' : '',
                ]"
              >
                <Calendar class="h-4 w-4" />
                {{ t(`experience.positions.${position}.period`) }}
              </div>

              <!-- Description -->
              <p :class="['mb-4 text-muted-foreground', index % 2 === 0 ? 'md:text-right' : '']">
                {{ t(`experience.positions.${position}.description`) }}
              </p>

              <!-- Achievements -->
              <ul class="mb-4 space-y-2">
                <li
                  v-for="(achievement, i) in tm(
                    `experience.positions.${position}.achievements`
                  ) as string[]"
                  :key="i"
                  :class="[
                    'flex items-start gap-2 text-sm text-muted-foreground',
                    index % 2 === 0 ? 'md:flex-row-reverse md:text-right' : '',
                  ]"
                >
                  <ChevronRight class="mt-0.5 h-4 w-4 shrink-0 text-primary" />
                  {{ achievement }}
                </li>
              </ul>

              <!-- Tech stack -->
              <div :class="['flex flex-wrap gap-2', index % 2 === 0 ? 'md:justify-end' : '']">
                <Badge
                  v-for="tech in tm(`experience.positions.${position}.tech`) as string[]"
                  :key="tech"
                >
                  {{ tech }}
                </Badge>
              </div>
            </Card>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
