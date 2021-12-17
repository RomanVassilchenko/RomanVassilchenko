<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { GraduationCap, MapPin, Calendar, BookOpen, FileText } from 'lucide-vue-next'
import Card from '../ui/Card.vue'

const { t } = useI18n()

const degrees = ['masters', 'bachelors'] as const
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
    </div>
  </section>
</template>
