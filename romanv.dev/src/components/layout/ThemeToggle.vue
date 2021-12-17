<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { Sun, Moon, Monitor } from 'lucide-vue-next'

type Theme = 'light' | 'dark' | 'system'

const theme = ref<Theme>('system')
const isOpen = ref(false)

const themes: { value: Theme; icon: typeof Sun }[] = [
  { value: 'light', icon: Sun },
  { value: 'dark', icon: Moon },
  { value: 'system', icon: Monitor },
]

const applyTheme = (t: Theme) => {
  const root = document.documentElement

  if (t === 'system') {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches
    root.classList.toggle('dark', prefersDark)
  } else {
    root.classList.toggle('dark', t === 'dark')
  }
}

const setTheme = (newTheme: Theme) => {
  theme.value = newTheme
  localStorage.setItem('theme', newTheme)
  applyTheme(newTheme)
  isOpen.value = false
}

const getCurrentIcon = () => {
  return themes.find((t) => t.value === theme.value)?.icon || Sun
}

onMounted(() => {
  const saved = localStorage.getItem('theme') as Theme | null
  if (saved) {
    theme.value = saved
  }
  applyTheme(theme.value)

  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
    if (theme.value === 'system') {
      document.documentElement.classList.toggle('dark', e.matches)
    }
  })
})
</script>

<template>
  <div class="relative">
    <button
      @click="isOpen = !isOpen"
      class="rounded-md p-2 text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
      aria-label="Toggle theme"
    >
      <component :is="getCurrentIcon()" class="h-5 w-5" />
    </button>

    <div
      v-if="isOpen"
      class="absolute right-0 mt-2 w-36 overflow-hidden rounded-lg border border-border bg-popover shadow-lg"
    >
      <button
        v-for="t in themes"
        :key="t.value"
        @click="setTheme(t.value)"
        :class="[
          'flex w-full items-center gap-2 px-3 py-2 text-sm transition-colors',
          theme === t.value
            ? 'bg-accent text-accent-foreground'
            : 'text-muted-foreground hover:bg-accent hover:text-foreground',
        ]"
      >
        <component :is="t.icon" class="h-4 w-4" />
        <span class="capitalize">{{ t.value }}</span>
      </button>
    </div>
  </div>

  <!-- Backdrop to close dropdown -->
  <div v-if="isOpen" @click="isOpen = false" class="fixed inset-0 z-[-1]" />
</template>
