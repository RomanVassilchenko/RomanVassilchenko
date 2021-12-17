<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { useI18n } from 'vue-i18n'
import ThemeToggle from './ThemeToggle.vue'
import LanguageSwitch from './LanguageSwitch.vue'
import { Menu, X } from 'lucide-vue-next'

const { t } = useI18n()

const isScrolled = ref(false)
const isMobileMenuOpen = ref(false)

const navItems = [
  { key: 'experience', href: '#experience' },
  { key: 'skills', href: '#skills' },
  { key: 'projects', href: '#projects' },
  { key: 'education', href: '#education' },
  { key: 'contact', href: '#contact' },
]

const handleScroll = () => {
  isScrolled.value = window.scrollY > 20
}

const closeMobileMenu = () => {
  isMobileMenuOpen.value = false
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<template>
  <header
    :class="[
      'fixed left-0 right-0 top-0 z-50 transition-all duration-300',
      isScrolled
        ? 'border-b border-border bg-background/80 shadow-sm backdrop-blur-lg'
        : 'bg-transparent',
    ]"
  >
    <nav class="container mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex h-16 items-center justify-between">
        <!-- Logo -->
        <a
          href="#"
          class="text-lg font-semibold text-foreground transition-colors hover:text-primary"
        >
          RV
        </a>

        <!-- Desktop Navigation -->
        <div class="hidden items-center gap-1 md:flex">
          <a
            v-for="item in navItems"
            :key="item.key"
            :href="item.href"
            class="rounded-md px-3 py-2 text-sm text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
          >
            {{ t(`nav.${item.key}`) }}
          </a>
        </div>

        <!-- Right side controls -->
        <div class="flex items-center gap-2">
          <LanguageSwitch />
          <ThemeToggle />

          <!-- Mobile menu button -->
          <button
            @click="isMobileMenuOpen = !isMobileMenuOpen"
            class="rounded-md p-2 text-muted-foreground transition-colors hover:bg-accent hover:text-foreground md:hidden"
          >
            <Menu v-if="!isMobileMenuOpen" class="h-5 w-5" />
            <X v-else class="h-5 w-5" />
          </button>
        </div>
      </div>

      <!-- Mobile Navigation -->
      <div v-if="isMobileMenuOpen" class="border-t border-border py-4 md:hidden">
        <div class="flex flex-col gap-1">
          <a
            v-for="item in navItems"
            :key="item.key"
            :href="item.href"
            @click="closeMobileMenu"
            class="rounded-md px-3 py-2 text-sm text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
          >
            {{ t(`nav.${item.key}`) }}
          </a>
        </div>
      </div>
    </nav>
  </header>
</template>
