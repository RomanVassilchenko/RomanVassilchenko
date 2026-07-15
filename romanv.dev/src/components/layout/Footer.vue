<script setup lang="ts">
import { useI18n } from 'vue-i18n'

const { t } = useI18n()
</script>

<template>
  <footer class="border-t border-border bg-card">
    <div
      class="page-shell flex flex-col gap-3 py-5 text-xs text-muted-foreground sm:flex-row sm:items-center sm:justify-between"
    >
      <p class="font-mono">
        {{ t('footer.status') }}
      </p>
      <p class="font-mono">{{ t('footer.meta') }}</p>
    </div>
  </footer>
</template>
