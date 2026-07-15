<script setup lang="ts">
import { computed, onMounted, onUnmounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import { Check, Monitor, Moon, Sun } from 'lucide-vue-next'
import { useTheme, type Theme } from '@/composables/useTheme'

const { t } = useI18n()
const { theme, setTheme } = useTheme()
const isOpen = ref(false)
const root = ref<HTMLElement | null>(null)
const trigger = ref<HTMLButtonElement | null>(null)

const themes: { value: Theme; icon: typeof Sun }[] = [
  { value: 'light', icon: Sun },
  { value: 'dark', icon: Moon },
  { value: 'system', icon: Monitor },
]

const currentIcon = computed(
  () => themes.find((item) => item.value === theme.value)?.icon ?? Monitor
)

const close = (restoreFocus = false) => {
  isOpen.value = false
  if (restoreFocus) trigger.value?.focus()
}

const selectTheme = (value: Theme) => {
  setTheme(value)
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
      class="flex h-10 w-10 items-center justify-center text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
      :aria-label="t('theme.change')"
      :aria-expanded="isOpen"
      @click="isOpen = !isOpen"
    >
      <component :is="currentIcon" class="h-4 w-4" />
    </button>

    <div
      v-if="isOpen"
      class="absolute right-0 top-full z-50 mt-2 w-40 border border-border bg-popover p-1 shadow-xl"
      role="group"
      :aria-label="t('theme.change')"
    >
      <button
        v-for="item in themes"
        :key="item.value"
        class="flex min-h-10 w-full items-center gap-2 px-3 text-sm text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
        :aria-pressed="theme === item.value"
        @click="selectTheme(item.value)"
      >
        <component :is="item.icon" class="h-4 w-4" />
        <span>{{ t(`theme.${item.value}`) }}</span>
        <Check v-if="theme === item.value" class="ml-auto h-4 w-4 text-success" />
      </button>
    </div>
  </div>
</template>
