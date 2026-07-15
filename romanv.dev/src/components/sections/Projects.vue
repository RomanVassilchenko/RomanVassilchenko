<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { ArrowUpRight, CheckCircle2, LockKeyhole } from 'lucide-vue-next'
import Badge from '../ui/Badge.vue'

const { t, tm } = useI18n()
const projects = ['autoLoan', 'staffPortal', 'matrixHiring', 'adalqarau'] as const

const getProjectUrl = (project: string): string | undefined => {
  const url = t(`projects.items.${project}.url`, '')
  return url && url !== `projects.items.${project}.url` ? url : undefined
}
</script>

<template>
  <section id="projects" class="section-shell border-b border-border bg-card/40">
    <div class="page-shell">
      <div class="mb-12 grid gap-6 lg:grid-cols-[minmax(0,1fr)_22rem] lg:items-end">
        <div>
          <p class="section-kicker">01 / {{ t('projects.kicker') }}</p>
          <h2 class="section-heading">{{ t('projects.title') }}</h2>
        </div>
        <p class="text-base leading-7 text-muted-foreground">{{ t('projects.intro') }}</p>
      </div>

      <div class="border-x border-t border-border">
        <article
          v-for="(project, index) in projects"
          :key="project"
          class="group grid border-b border-border bg-background transition-colors hover:bg-card lg:grid-cols-[11rem_minmax(0,1fr)_minmax(17rem,0.72fr)]"
        >
          <div class="border-b border-border p-5 lg:border-b-0 lg:border-r lg:p-6">
            <p class="font-mono text-xs text-primary">0{{ index + 1 }}</p>
            <p
              class="mt-3 flex items-center gap-2 font-mono text-[11px] uppercase tracking-[0.12em] text-muted-foreground"
            >
              <CheckCircle2 v-if="getProjectUrl(project)" class="h-3.5 w-3.5 text-success" />
              <LockKeyhole v-else class="h-3.5 w-3.5" />
              {{ getProjectUrl(project) ? t('projects.public') : t('projects.internal') }}
            </p>
          </div>

          <div class="p-5 sm:p-6 lg:p-8">
            <p class="mb-2 font-mono text-xs text-primary">
              {{ t(`projects.items.${project}.description`) }}
            </p>
            <h3 class="text-2xl font-semibold tracking-[-0.03em] text-foreground sm:text-3xl">
              <a
                v-if="getProjectUrl(project)"
                :href="getProjectUrl(project)"
                target="_blank"
                rel="noopener noreferrer"
                class="inline-flex items-center gap-2 transition-colors hover:text-primary"
              >
                {{ t(`projects.items.${project}.name`) }}
                <ArrowUpRight class="h-5 w-5" />
              </a>
              <span v-else>{{ t(`projects.items.${project}.name`) }}</span>
            </h3>
            <p
              class="mt-4 max-w-2xl text-sm leading-6 text-muted-foreground sm:text-base sm:leading-7"
            >
              {{ t(`projects.items.${project}.details`) }}
            </p>
            <div class="mt-5 border-l-2 border-primary pl-4">
              <p class="font-mono text-[10px] uppercase tracking-[0.12em] text-muted-foreground">
                {{ t('projects.contribution') }}
              </p>
              <p class="mt-1 text-sm leading-6 text-foreground">
                {{ t(`projects.items.${project}.contribution`) }}
              </p>
            </div>
            <div class="mt-6 flex flex-wrap gap-1.5">
              <Badge
                v-for="tech in tm(`projects.items.${project}.tech`) as string[]"
                :key="tech"
                variant="outline"
              >
                {{ tech }}
              </Badge>
            </div>
          </div>

          <div
            class="border-t border-border bg-muted/35 p-5 sm:p-6 lg:border-l lg:border-t-0 lg:p-8"
          >
            <p class="mb-4 font-mono text-[11px] uppercase tracking-[0.14em] text-muted-foreground">
              {{ t('projects.outcomes') }}
            </p>
            <ul class="space-y-4">
              <li
                v-for="(highlight, highlightIndex) in tm(
                  `projects.items.${project}.highlights`
                ) as string[]"
                :key="highlightIndex"
                class="flex gap-3 text-sm leading-6 text-foreground"
              >
                <span class="mt-2 h-1.5 w-1.5 shrink-0 bg-success" aria-hidden="true"></span>
                {{ highlight }}
              </li>
            </ul>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>
