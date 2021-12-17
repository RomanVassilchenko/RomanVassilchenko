<script setup lang="ts">
import { cn, type ClassValue } from '@/lib/utils'

interface Props {
  class?: ClassValue
}

const props = defineProps<Props>()
</script>

<template>
  <div :class="cn('rounded-xl border bg-card text-card-foreground shadow-sm', props.class)">
    <slot />
  </div>
</template>
