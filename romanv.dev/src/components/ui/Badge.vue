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
    'inline-flex items-center rounded-md px-2.5 py-0.5 text-xs font-medium transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2'

  const variants = {
    default: 'bg-primary/10 text-primary border border-primary/20',
    secondary: 'bg-secondary text-secondary-foreground',
    outline: 'border border-input bg-background text-foreground',
  }

  return cn(base, variants[props.variant])
})
</script>

<template>
  <span :class="classes">
    <slot />
  </span>
</template>
