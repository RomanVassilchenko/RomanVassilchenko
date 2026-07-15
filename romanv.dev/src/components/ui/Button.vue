<script setup lang="ts">
import { computed } from 'vue'
import { cn } from '@/lib/utils'

interface Props {
  variant?: 'default' | 'outline' | 'ghost' | 'link'
  size?: 'default' | 'sm' | 'lg' | 'icon'
  as?: string
}

const props = withDefaults(defineProps<Props>(), {
  variant: 'default',
  size: 'default',
  as: 'button',
})

const classes = computed(() => {
  const base =
    'inline-flex items-center justify-center whitespace-nowrap border text-sm font-medium transition-colors focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50'

  const variants = {
    default: 'border-primary bg-primary text-primary-foreground hover:bg-primary/85',
    outline:
      'border-input bg-transparent text-foreground hover:border-primary hover:bg-accent hover:text-accent-foreground',
    ghost: 'border-transparent hover:bg-accent hover:text-accent-foreground',
    link: 'text-primary underline-offset-4 hover:underline',
  }

  const sizes = {
    default: 'h-9 px-4 py-2',
    sm: 'h-8 px-3 text-xs',
    lg: 'h-11 px-6',
    icon: 'h-9 w-9',
  }

  return cn(base, variants[props.variant], sizes[props.size])
})
</script>

<template>
  <component :is="as" :class="classes">
    <slot />
  </component>
</template>
