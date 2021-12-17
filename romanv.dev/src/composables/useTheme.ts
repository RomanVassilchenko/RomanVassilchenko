import { ref, watch, onMounted } from 'vue'

export type Theme = 'light' | 'dark' | 'system'

const theme = ref<Theme>('system')

export function useTheme() {
  const setTheme = (newTheme: Theme) => {
    theme.value = newTheme
    localStorage.setItem('theme', newTheme)
    applyTheme(newTheme)
  }

  const applyTheme = (t: Theme) => {
    const root = document.documentElement

    if (t === 'system') {
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches
      root.classList.toggle('dark', prefersDark)
    } else {
      root.classList.toggle('dark', t === 'dark')
    }
  }

  const initTheme = () => {
    const saved = localStorage.getItem('theme') as Theme | null
    if (saved) {
      theme.value = saved
    }
    applyTheme(theme.value)

    // Listen for system theme changes
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
      if (theme.value === 'system') {
        document.documentElement.classList.toggle('dark', e.matches)
      }
    })
  }

  onMounted(() => {
    initTheme()
  })

  watch(theme, (newTheme) => {
    applyTheme(newTheme)
  })

  return {
    theme,
    setTheme,
    initTheme,
  }
}
