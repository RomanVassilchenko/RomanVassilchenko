<script setup lang="ts">
import { ref, computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { Languages } from 'lucide-vue-next'

const { locale } = useI18n()
const isOpen = ref(false)

const languages = [
  { code: 'en', name: 'English', flag: 'EN' },
  { code: 'ru', name: 'Русский', flag: 'RU' },
] as const

const setLanguage = (code: string) => {
  locale.value = code
  localStorage.setItem('locale', code)
  isOpen.value = false
}

const currentFlag = computed(() => {
  const found = languages.find((l) => l.code === locale.value)
  return found ? found.flag : 'EN'
})
</script>

<template>
  <div class="relative">
    <button
      @click="isOpen = !isOpen"
      class="flex items-center gap-1.5 rounded-md px-2 py-1.5 text-sm text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
      aria-label="Change language"
    >
      <Languages class="h-4 w-4" />
      <span class="font-medium">{{ currentFlag }}</span>
    </button>

    <div
      v-if="isOpen"
      class="absolute right-0 mt-2 w-36 overflow-hidden rounded-lg border border-border bg-popover shadow-lg"
    >
      <button
        v-for="lang in languages"
        :key="lang.code"
        @click="setLanguage(lang.code)"
        :class="[
          'flex w-full items-center gap-2 px-3 py-2 text-sm transition-colors',
          locale === lang.code
            ? 'bg-accent text-accent-foreground'
            : 'text-muted-foreground hover:bg-accent hover:text-foreground',
        ]"
      >
        <span class="font-medium">{{ lang.flag }}</span>
        <span>{{ lang.name }}</span>
      </button>
    </div>
  </div>

  <!-- Backdrop to close dropdown -->
  <div v-if="isOpen" @click="isOpen = false" class="fixed inset-0 z-[-1]" />
</template>
