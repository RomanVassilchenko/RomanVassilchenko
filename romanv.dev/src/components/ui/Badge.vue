<script setup lang="ts">
import { computed } from 'vue'
import { cn } from '@/lib/utils'

interface Props {
  variant?: 'default' | 'secondary' | 'outline'
}

const props = withDefaults(defineProps<Props>(), {
  variant: 'default',
})

const classes = computed(() => {
  const base =
    'inline-flex items-center border px-2 py-0.5 font-mono text-[11px] font-medium transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2'

  const variants = {
    default: 'border-primary/30 bg-primary/10 text-primary',
    secondary: 'border-border bg-secondary text-secondary-foreground',
    outline: 'border-input bg-transparent text-foreground',
  }

  return cn(base, variants[props.variant])
})
</script>

<template>
  <span :class="classes">
    <slot />
  </span>
</template>
