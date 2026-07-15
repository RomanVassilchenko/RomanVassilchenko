<script setup lang="ts">
import { computed, onMounted, onUnmounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import { Check, Languages } from 'lucide-vue-next'

const { locale, t } = useI18n()
const isOpen = ref(false)
const root = ref<HTMLElement | null>(null)
const trigger = ref<HTMLButtonElement | null>(null)

const languages = [
  { code: 'en', name: 'English', short: 'EN' },
  { code: 'ru', name: 'Русский', short: 'RU' },
] as const

const currentLanguage = computed(() => languages.find((language) => language.code === locale.value))

const close = (restoreFocus = false) => {
  isOpen.value = false
  if (restoreFocus) trigger.value?.focus()
}

const setLanguage = (code: string) => {
  locale.value = code
  document.documentElement.lang = code
  localStorage.setItem('locale', code)
  close(true)
}

const handlePointerDown = (event: PointerEvent) => {
  if (!root.value?.contains(event.target as Node)) close()
}

const handleKeydown = (event: KeyboardEvent) => {
  if (event.key === 'Escape' && isOpen.value) close(true)
}

const handleFocusOut = (event: FocusEvent) => {
  if (!root.value?.contains(event.relatedTarget as Node | null)) close()
}

onMounted(() => {
  document.addEventListener('pointerdown', handlePointerDown)
  document.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  document.removeEventListener('pointerdown', handlePointerDown)
  document.removeEventListener('keydown', handleKeydown)
})
</script>

<template>
  <div ref="root" class="relative" @focusout="handleFocusOut">
    <button
      ref="trigger"
      class="flex h-10 min-w-10 items-center justify-center gap-1.5 px-2 font-mono text-xs text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
      :aria-label="t('language.change')"
      :aria-expanded="isOpen"
      @click="isOpen = !isOpen"
    >
      <Languages class="h-4 w-4" />
      <span>{{ currentLanguage?.short }}</span>
    </button>

    <div
      v-if="isOpen"
      class="absolute right-0 top-full z-50 mt-2 w-40 border border-border bg-popover p-1 shadow-xl"
      role="group"
      :aria-label="t('language.change')"
    >
      <button
        v-for="language in languages"
        :key="language.code"
        class="flex min-h-10 w-full items-center justify-between px-3 text-left text-sm text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
        :aria-pressed="locale === language.code"
        @click="setLanguage(language.code)"
      >
        <span
          ><span class="mr-2 font-mono text-xs text-primary">{{ language.short }}</span
          >{{ language.name }}</span
        >
        <Check v-if="locale === language.code" class="h-4 w-4 text-success" />
      </button>
    </div>
  </div>
</template>
