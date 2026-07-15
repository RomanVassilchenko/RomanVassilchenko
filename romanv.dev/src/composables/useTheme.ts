import { onMounted, onUnmounted, ref } from 'vue'

export type Theme = 'light' | 'dark' | 'system'

const isTheme = (value: string | null): value is Theme =>
  value === 'light' || value === 'dark' || value === 'system'

const getSavedTheme = (): Theme => {
  if (typeof window === 'undefined') return 'system'
  const savedTheme = window.localStorage.getItem('theme')
  return isTheme(savedTheme) ? savedTheme : 'system'
}

const theme = ref<Theme>(getSavedTheme())
let mediaQuery: MediaQueryList | null = null
let consumers = 0

const getMediaQuery = () => {
  if (typeof window === 'undefined') return null
  mediaQuery ??= window.matchMedia('(prefers-color-scheme: dark)')
  return mediaQuery
}

const applyTheme = (value: Theme) => {
  if (typeof document === 'undefined') return
  const prefersDark = getMediaQuery()?.matches ?? false
  const isDark = value === 'dark' || (value === 'system' && prefersDark)
  document.documentElement.classList.toggle('dark', isDark)
}

const handleSystemChange = () => {
  if (theme.value === 'system') applyTheme('system')
}

export function useTheme() {
  const setTheme = (value: Theme) => {
    theme.value = value
    window.localStorage.setItem('theme', value)
    applyTheme(value)
  }

  onMounted(() => {
    consumers += 1
    applyTheme(theme.value)
    if (consumers === 1) getMediaQuery()?.addEventListener('change', handleSystemChange)
  })

  onUnmounted(() => {
    consumers -= 1
    if (consumers === 0) getMediaQuery()?.removeEventListener('change', handleSystemChange)
  })

  return { theme, setTheme }
}
