<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { ExternalLink } from 'lucide-vue-next'
import Card from '../ui/Card.vue'
import Badge from '../ui/Badge.vue'

const { t, tm } = useI18n()

const projects = ['adalqarau', 'staffPortal', 'matrixHiring', 'autoLoan'] as const

const getProjectUrl = (project: string): string | undefined => {
  const url = t(`projects.items.${project}.url`, '')
  return url && url !== `projects.items.${project}.url` ? url : undefined
}
</script>

<template>
  <section id="projects" class="px-4 py-20">
    <div class="container mx-auto max-w-5xl">
      <!-- Section Title -->
      <h2 class="mb-4 text-center text-3xl font-bold md:text-4xl">
        {{ t('projects.title') }}
      </h2>
      <div class="mx-auto mb-12 h-1 w-20 rounded-full bg-primary"></div>

      <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
        <Card
          v-for="(project, index) in projects"
          :key="project"
          :class="[
            'group flex flex-col p-6 transition-colors hover:border-primary/50',
            index === 0 ? 'md:col-span-2 lg:col-span-3' : '',
          ]"
        >
          <div :class="index === 0 ? 'grid gap-6 lg:grid-cols-[1.2fr_0.8fr]' : 'contents'">
            <div>
              <p v-if="index === 0" class="mb-2 text-sm font-medium text-primary">
                {{ t('projects.featuredCase') }}
              </p>

              <h3
                class="mb-1 text-lg font-semibold text-foreground transition-colors group-hover:text-primary"
              >
                <a
                  v-if="getProjectUrl(project)"
                  :href="getProjectUrl(project)"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="inline-flex items-center gap-1.5 hover:underline"
                >
                  {{ t(`projects.items.${project}.name`) }}
                  <ExternalLink class="h-4 w-4" />
                </a>
                <span v-else>{{ t(`projects.items.${project}.name`) }}</span>
              </h3>

              <p class="mb-3 text-sm font-medium text-primary">
                {{ t(`projects.items.${project}.description`) }}
              </p>

              <p class="mb-4 flex-1 text-sm text-muted-foreground">
                {{ t(`projects.items.${project}.details`) }}
              </p>
            </div>

            <div
              :class="[
                'flex flex-col',
                index === 0 ? 'rounded-lg border border-border bg-muted/30 p-4' : '',
              ]"
            >
              <ul class="mb-4 space-y-1">
                <li
                  v-for="(highlight, i) in tm(`projects.items.${project}.highlights`) as string[]"
                  :key="i"
                  class="flex items-start gap-2 text-xs text-muted-foreground"
                >
                  <span class="text-primary">•</span>
                  {{ highlight }}
                </li>
              </ul>

              <div class="mt-auto flex flex-wrap gap-1.5 border-t border-border pt-4">
                <Badge
                  v-for="tech in tm(`projects.items.${project}.tech`) as string[]"
                  :key="tech"
                  variant="secondary"
                  class="text-xs"
                >
                  {{ tech }}
                </Badge>
              </div>
            </div>
          </div>
        </Card>
      </div>
    </div>
  </section>
</template>
