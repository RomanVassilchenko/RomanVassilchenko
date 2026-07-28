<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { ArrowUpRight, FileText } from 'lucide-vue-next'
import { resumeFlags } from '@/config/resume'

const { t } = useI18n()
const degrees = resumeFlags.showMastersEducation
  ? (['masters', 'bachelors'] as const)
  : (['bachelors'] as const)
</script>

<template>
  <section id="education" class="section-shell border-b border-border">
    <div class="page-shell">
      <div class="grid gap-10 lg:grid-cols-[minmax(14rem,0.7fr)_minmax(0,1.3fr)] lg:gap-16">
        <div class="min-w-0">
          <p class="section-kicker">{{ t('education.kicker') }}</p>
          <h2
            class="text-balance text-4xl font-semibold tracking-[-0.05em] text-foreground sm:text-5xl"
          >
            {{ t('education.title') }}
          </h2>
        </div>

        <div class="min-w-0 border-t border-border">
          <article
            v-for="degree in degrees"
            :key="degree"
            class="grid gap-4 border-b border-border py-7 sm:grid-cols-[minmax(0,1fr)_auto] sm:gap-8"
          >
            <div>
              <p class="font-mono text-xs text-primary">
                {{ t(`education.degrees.${degree}.school`) }}
              </p>
              <h3 class="mt-2 text-xl font-semibold tracking-[-0.02em] text-foreground">
                {{ t(`education.degrees.${degree}.degree`) }}
              </h3>
              <p class="mt-3 max-w-2xl text-sm leading-6 text-muted-foreground">
                {{ t(`education.degrees.${degree}.focus`) }}
              </p>
              <p
                v-if="t(`education.degrees.${degree}.note`, '')"
                class="mt-2 text-xs leading-5 text-muted-foreground"
              >
                {{ t(`education.degrees.${degree}.note`) }}
              </p>
              <a
                v-if="degree === 'bachelors'"
                href="/documents/diploma_bachelor.pdf"
                target="_blank"
                rel="noopener noreferrer"
                class="mt-5 inline-flex min-h-9 items-center gap-2 font-mono text-xs text-primary hover:underline"
              >
                <FileText class="h-4 w-4" />
                {{ t('education.thesis') }}
                <ArrowUpRight class="h-3.5 w-3.5" />
              </a>
            </div>
            <div class="sm:text-right">
              <p class="font-mono text-xs text-foreground">
                {{ t(`education.degrees.${degree}.period`) }}
              </p>
              <p class="mt-1 text-xs text-muted-foreground">
                {{ t(`education.degrees.${degree}.location`) }}
              </p>
            </div>
          </article>
        </div>
      </div>
    </div>
  </section>
</template>
