<script setup lang="ts">
import Header from './components/layout/Header.vue'
import Hero from './components/sections/Hero.vue'
import Experience from './components/sections/Experience.vue'
import TechStack from './components/sections/TechStack.vue'
import Projects from './components/sections/Projects.vue'
import Education from './components/sections/Education.vue'
import Contact from './components/sections/Contact.vue'
import Services from './components/sections/Services.vue'
import Footer from './components/layout/Footer.vue'
</script>

<template>
  <div class="min-h-screen bg-background font-sans text-foreground">
    <Header />
    <main>
      <Hero />
      <Experience />
      <TechStack />
      <Projects />
      <Education />
      <Contact />
      <Services />
    </main>
    <Footer />
  </div>
</template>
