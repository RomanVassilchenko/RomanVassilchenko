import { createI18n } from 'vue-i18n'
import en from './locales/en'
import ru from './locales/ru'

const savedLocale = typeof localStorage !== 'undefined' ? localStorage.getItem('locale') : null

const browserLocale = typeof navigator !== 'undefined' ? navigator.language.split('-')[0] : 'en'
const initialLocale = savedLocale || (browserLocale === 'ru' ? 'ru' : 'en')

if (typeof document !== 'undefined') {
  document.documentElement.lang = initialLocale
}

export const i18n = createI18n({
  legacy: false,
  locale: initialLocale,
  fallbackLocale: 'en',
  messages: {
    en,
    ru,
  },
})

export default i18n
