import { createI18n } from 'vue-i18n'
import en from './locales/en'
import ru from './locales/ru'

const savedLocale = typeof localStorage !== 'undefined' ? localStorage.getItem('locale') : null

const browserLocale = typeof navigator !== 'undefined' ? navigator.language.split('-')[0] : 'en'

export const i18n = createI18n({
  legacy: false,
  locale: savedLocale || (browserLocale === 'ru' ? 'ru' : 'en'),
  fallbackLocale: 'en',
  messages: {
    en,
    ru,
  },
})

export default i18n
