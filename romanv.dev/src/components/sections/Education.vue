<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { GraduationCap, MapPin, Calendar, BookOpen, FileText, ExternalLink } from 'lucide-vue-next'
import { resumeFlags } from '@/config/resume'
import Card from '../ui/Card.vue'
import Badge from '../ui/Badge.vue'

const { t, tm } = useI18n()

const degrees = resumeFlags.showMastersEducation
  ? (['masters', 'bachelors'] as const)
  : (['bachelors'] as const)
</script>

<template>
  <section id="education" class="bg-muted/30 px-4 py-20">
    <div class="container mx-auto max-w-4xl">
      <!-- Section Title -->
      <h2 class="mb-4 text-center text-3xl font-bold md:text-4xl">
        {{ t('education.title') }}
      </h2>
      <div class="mx-auto mb-12 h-1 w-20 rounded-full bg-primary"></div>

      <!-- Education cards -->
      <div class="space-y-6">
        <Card
          v-for="degree in degrees"
          :key="degree"
          class="p-6 transition-colors hover:border-primary/50"
        >
          <div class="flex flex-col gap-4 md:flex-row md:items-start">
            <!-- Icon -->
            <div class="w-fit shrink-0 rounded-xl bg-primary/10 p-3">
              <GraduationCap class="h-8 w-8 text-primary" />
            </div>

            <!-- Content -->
            <div class="flex-1">
              <!-- Degree -->
              <h3 class="mb-1 text-xl font-semibold text-foreground">
                {{ t(`education.degrees.${degree}.degree`) }}
              </h3>

              <!-- School -->
              <p class="mb-2 font-medium text-primary">
                {{ t(`education.degrees.${degree}.school`) }}
              </p>

              <!-- Meta info -->
              <div class="mb-3 flex flex-wrap items-center gap-4 text-sm text-muted-foreground">
                <span class="flex items-center gap-1.5">
                  <MapPin class="h-4 w-4" />
                  {{ t(`education.degrees.${degree}.location`) }}
                </span>
                <span class="flex items-center gap-1.5">
                  <Calendar class="h-4 w-4" />
                  {{ t(`education.degrees.${degree}.period`) }}
                </span>
              </div>

              <!-- Focus -->
              <div class="flex items-center gap-2 text-sm text-muted-foreground">
                <BookOpen class="h-4 w-4 text-primary" />
                {{ t(`education.degrees.${degree}.focus`) }}
              </div>

              <!-- Note (if exists) -->
              <p
                v-if="t(`education.degrees.${degree}.note`, '')"
                class="mt-3 text-sm italic text-muted-foreground/80"
              >
                {{ t(`education.degrees.${degree}.note`) }}
              </p>

              <!-- Thesis link for bachelors -->
              <a
                v-if="degree === 'bachelors'"
                href="/documents/diploma_bachelor.pdf"
                target="_blank"
                class="mt-4 inline-flex items-center gap-2 text-sm text-muted-foreground transition-colors hover:text-primary"
              >
                <FileText class="h-4 w-4" />
                {{ t('education.thesis') }}
              </a>
            </div>

            <!-- Period badge (desktop) -->
            <div
              class="hidden shrink-0 rounded-full bg-primary/10 px-3 py-1 text-sm font-medium text-primary md:block"
            >
              {{ t(`education.degrees.${degree}.period`) }}
            </div>
          </div>
        </Card>
      </div>

      <!-- AdalQarau project block -->
      <div class="mt-12">
        <h3 class="mb-6 text-center text-lg font-semibold text-muted-foreground">
          {{ t('education.projectTitle') }}
        </h3>
        <Card class="p-6 transition-colors hover:border-primary/50">
          <div class="flex flex-col gap-4">
            <!-- Header -->
            <div class="flex items-start justify-between gap-4">
              <div>
                <h4 class="text-xl font-semibold text-foreground">
                  <a
                    :href="t('projects.items.adalqarau.url')"
                    target="_blank"
                    class="inline-flex items-center gap-1.5 transition-colors hover:text-primary hover:underline"
                  >
                    {{ t('projects.items.adalqarau.name') }}
                    <ExternalLink class="h-4 w-4" />
                  </a>
                </h4>
                <p class="mt-1 text-sm font-medium text-primary">
                  {{ t('projects.items.adalqarau.description') }}
                </p>
              </div>
            </div>

            <!-- Details -->
            <p class="text-sm text-muted-foreground">
              {{ t('projects.items.adalqarau.details') }}
            </p>

            <!-- Highlights -->
            <ul class="space-y-1">
              <li
                v-for="(highlight, i) in tm('projects.items.adalqarau.highlights') as string[]"
                :key="i"
                class="flex items-start gap-2 text-sm text-muted-foreground"
              >
                <span class="text-primary">•</span>
                {{ highlight }}
              </li>
            </ul>

            <!-- Tech stack -->
            <div class="flex flex-wrap gap-1.5 border-t border-border pt-4">
              <Badge
                v-for="tech in tm('projects.items.adalqarau.tech') as string[]"
                :key="tech"
                variant="secondary"
                class="text-xs"
              >
                {{ tech }}
              </Badge>
            </div>
          </div>
        </Card>
      </div>
    </div>
  </section>
</template>
