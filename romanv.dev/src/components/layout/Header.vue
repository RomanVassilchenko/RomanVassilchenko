<script setup lang="ts">
import { onMounted, onUnmounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import { FileText, Menu, X } from 'lucide-vue-next'
import ThemeToggle from './ThemeToggle.vue'
import LanguageSwitch from './LanguageSwitch.vue'

const { t, locale } = useI18n()
const isScrolled = ref(false)
const isMobileMenuOpen = ref(false)
const mobileMenuTrigger = ref<HTMLButtonElement | null>(null)

const navItems = [
  { key: 'projects', href: '#projects', index: '01' },
  { key: 'experience', href: '#experience', index: '02' },
  { key: 'skills', href: '#skills', index: '03' },
  { key: 'education', href: '#education', index: '04' },
  { key: 'contact', href: '#contact', index: '05' },
]

const handleScroll = () => {
  isScrolled.value = window.scrollY > 12
}

const closeMobileMenu = () => {
  isMobileMenuOpen.value = false
}

const handleKeydown = (event: KeyboardEvent) => {
  if (event.key === 'Escape' && isMobileMenuOpen.value) {
    closeMobileMenu()
    mobileMenuTrigger.value?.focus()
  }
}

onMounted(() => {
  handleScroll()
  window.addEventListener('scroll', handleScroll, { passive: true })
  window.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
  window.removeEventListener('keydown', handleKeydown)
})
</script>

<template>
  <a
    href="#hero"
    class="fixed left-4 top-3 z-[60] -translate-y-20 bg-primary px-4 py-2 text-sm font-medium text-primary-foreground transition-transform focus:translate-y-0"
  >
    {{ t('nav.skip') }}
  </a>

  <header
    :class="[
      'fixed inset-x-0 top-0 z-50 border-b transition-colors duration-200',
      isScrolled || isMobileMenuOpen
        ? 'border-border bg-background/95 backdrop-blur-xl'
        : 'border-transparent bg-background/70 backdrop-blur-md',
    ]"
  >
    <nav class="page-shell" :aria-label="t('nav.primaryLabel')">
      <div class="flex h-16 items-center justify-between gap-4">
        <a
          href="#hero"
          class="group flex min-w-0 items-center gap-3"
          aria-label="Roman Vassilchenko"
        >
          <span
            class="flex h-8 w-8 shrink-0 items-center justify-center border border-primary bg-primary/10 font-mono text-xs font-semibold text-primary transition-colors group-hover:bg-primary group-hover:text-primary-foreground"
          >
            RV
          </span>
          <span class="hidden min-w-0 lg:block">
            <span class="block truncate text-sm font-semibold leading-none text-foreground"
              >Roman Vassilchenko</span
            >
            <span
              class="mt-1 block font-mono text-[10px] uppercase tracking-[0.16em] text-muted-foreground"
              >Go backend</span
            >
          </span>
        </a>

        <div class="hidden items-center lg:flex">
          <a
            v-for="item in navItems"
            :key="item.key"
            :href="item.href"
            class="group flex h-16 items-center gap-1.5 border-b-2 border-transparent px-3 text-sm text-muted-foreground transition-colors hover:border-primary hover:text-foreground"
          >
            <span class="font-mono text-[10px] text-primary/80">{{ item.index }}</span>
            {{ t(`nav.${item.key}`) }}
          </a>
        </div>

        <div class="flex items-center gap-1">
          <a
            :href="`/documents/resume_${locale}.pdf`"
            target="_blank"
            rel="noopener noreferrer"
            class="mr-1 hidden h-9 items-center gap-2 border border-primary bg-primary px-3 text-sm font-medium text-primary-foreground transition-colors hover:bg-primary/85 sm:flex"
          >
            <FileText class="h-4 w-4" />
            {{ t('nav.resume') }}
          </a>
          <LanguageSwitch />
          <ThemeToggle />
          <button
            ref="mobileMenuTrigger"
            class="flex h-10 w-10 items-center justify-center text-muted-foreground transition-colors hover:bg-accent hover:text-foreground lg:hidden"
            :aria-label="isMobileMenuOpen ? t('nav.closeMenu') : t('nav.openMenu')"
            :aria-expanded="isMobileMenuOpen"
            aria-controls="mobile-navigation"
            @click="isMobileMenuOpen = !isMobileMenuOpen"
          >
            <Menu v-if="!isMobileMenuOpen" class="h-5 w-5" />
            <X v-else class="h-5 w-5" />
          </button>
        </div>
      </div>

      <div
        v-if="isMobileMenuOpen"
        id="mobile-navigation"
        class="border-t border-border py-3 lg:hidden"
      >
        <div class="grid gap-1">
          <a
            v-for="item in navItems"
            :key="item.key"
            :href="item.href"
            class="flex min-h-11 items-center gap-3 px-3 text-sm text-muted-foreground hover:bg-accent hover:text-foreground"
            @click="closeMobileMenu"
          >
            <span class="font-mono text-xs text-primary">{{ item.index }}</span>
            {{ t(`nav.${item.key}`) }}
          </a>
          <a
            :href="`/documents/resume_${locale}.pdf`"
            target="_blank"
            rel="noopener noreferrer"
            class="mt-2 flex min-h-11 items-center gap-3 border border-primary px-3 text-sm font-medium text-primary"
            @click="closeMobileMenu"
          >
            <FileText class="h-4 w-4" />
            {{ t('nav.resume') }}
          </a>
        </div>
      </div>
    </nav>
  </header>
</template>
