<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import { Heart, Code } from 'lucide-vue-next'

const { t } = useI18n()
</script>

<template>
  <footer class="border-t border-border bg-muted/30">
    <div class="container mx-auto px-4 py-8 sm:px-6 lg:px-8">
      <div class="flex flex-col items-center justify-center gap-4">
        <!-- Made with love -->
        <p class="flex items-center gap-1.5 text-sm text-muted-foreground">
          {{ t('footer.madeWith') }}
          <Heart class="h-4 w-4 fill-current text-red" />
          {{ t('footer.and') }}
          <Code class="h-4 w-4 text-primary" />
        </p>
      </div>
    </div>
  </footer>
</template>
