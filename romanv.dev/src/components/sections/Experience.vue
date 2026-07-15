<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { ArrowRight } from 'lucide-vue-next'
import Badge from '../ui/Badge.vue'

const { t, tm } = useI18n()
const positions = ['bereke', 'ozonStaff', 'ozonIntern'] as const
</script>

<template>
  <section id="experience" class="section-shell border-b border-border">
    <div class="page-shell">
      <p class="section-kicker">02 / {{ t('experience.kicker') }}</p>
      <h2 class="section-heading">{{ t('experience.title') }}</h2>
      <p class="section-copy">{{ t('experience.intro') }}</p>

      <div class="relative mt-14 border-l border-border lg:ml-40">
        <article
          v-for="(position, index) in positions"
          :id="`experience-${position}`"
          :key="position"
          class="relative border-b border-border py-10 pl-6 first:pt-0 last:border-b-0 last:pb-0 sm:pl-10 lg:grid lg:grid-cols-[minmax(0,15rem)_minmax(0,1fr)] lg:gap-12"
        >
          <span
            class="absolute -left-[5px] h-2.5 w-2.5 border-2 border-background"
            :class="index === 0 ? 'top-2 bg-success' : 'top-12 bg-primary'"
            aria-hidden="true"
          ></span>

          <div class="mb-6 lg:mb-0">
            <p class="font-mono text-xs text-primary">
              {{ t(`experience.positions.${position}.period`) }}
            </p>
            <h3 class="mt-2 text-xl font-semibold tracking-[-0.02em] text-foreground">
              {{ t(`experience.positions.${position}.company`) }}
            </h3>
            <p class="mt-1 text-sm font-medium text-foreground">
              {{ t(`experience.positions.${position}.role`) }}
            </p>
            <p class="mt-2 text-xs leading-5 text-muted-foreground">
              {{ t(`experience.positions.${position}.team`) }}
            </p>
          </div>

          <div>
            <p class="max-w-3xl text-base leading-7 text-muted-foreground">
              {{ t(`experience.positions.${position}.description`) }}
            </p>
            <ul class="mt-6 grid gap-3">
              <li
                v-for="(achievement, achievementIndex) in tm(
                  `experience.positions.${position}.achievements`
                ) as string[]"
                :key="achievementIndex"
                class="flex max-w-3xl gap-3 text-sm leading-6 text-foreground"
              >
                <ArrowRight class="mt-1 h-4 w-4 shrink-0 text-primary" />
                {{ achievement }}
              </li>
            </ul>
            <div class="mt-6 flex flex-wrap gap-1.5">
              <Badge
                v-for="tech in tm(`experience.positions.${position}.tech`) as string[]"
                :key="tech"
                variant="secondary"
              >
                {{ tech }}
              </Badge>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>
