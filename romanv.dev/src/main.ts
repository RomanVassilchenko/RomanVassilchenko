import { createApp } from 'vue'
import App from './App.vue'
import i18n from './i18n'
import './style.css'

// Initialize theme before app mounts
const savedTheme = localStorage.getItem('theme')
const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches

if (
  savedTheme === 'dark' ||
  (savedTheme === 'system' && prefersDark) ||
  (!savedTheme && prefersDark)
) {
  document.documentElement.classList.add('dark')
}

const app = createApp(App)
app.use(i18n)
app.mount('#app')
