<script lang="ts" setup>
useHead({
  title: 'Ana Sayfa - Modern Web Uygulaması',
  meta: [
    { name: 'description', content: 'Modern ve kullanıcı dostu web uygulaması ana sayfası' }
  ]
})

const features = [
  {
    icon: 'i-heroicons-rocket-launch',
    title: 'Hızlı Geliştirme',
    description: 'Modern teknolojiler ile hızlı ve verimli geliştirme süreci'
  },
  {
    icon: 'i-heroicons-shield-check',
    title: 'Güvenli',
    description: 'En son güvenlik standartları ile korumalı altyapı'
  },
  {
    icon: 'i-heroicons-device-phone-mobile',
    title: 'Responsive Tasarım',
    description: 'Tüm cihazlarda mükemmel görünüm ve kullanım deneyimi'
  }
]
</script>

<template>
  <div class="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 dark:from-gray-900 dark:to-gray-800">
    <!-- Hero Section -->
    <div class="relative overflow-hidden">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24">
        <div class="text-center">
          <h1 class="text-4xl md:text-6xl font-bold text-gray-900 dark:text-white mb-6">
            Modern Web 
            <span class="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">
              Uygulaması
            </span>
          </h1>
          <p class="text-xl text-gray-600 dark:text-gray-300 mb-8 max-w-3xl mx-auto">
            Nuxt 3 ve Tailwind CSS ile oluşturulmuş modern, hızlı ve kullanıcı dostu web uygulaması. 
            En son teknolojiler ile güçlendirilmiş profesyonel çözümler.
          </p>
          
          <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <UButton size="lg" class="px-8 py-3" to="/login">
              Giriş Ekranına Git
            </UButton>
            <UButton variant="outline" size="lg" class="px-8 py-3" to="/profile">
              Profili Görüntüle
            </UButton>
          </div>
        </div>
      </div>
    </div>

    <!-- Features Section -->
    <div class="py-20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 dark:text-white mb-4">
            Özellikler
          </h2>
          <p class="text-lg text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
            Modern web geliştirme araçları ile oluşturulmuş güçlü özellikler
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <UCard v-for="feature in features" :key="feature.title" class="p-6">
            <div class="text-center">
              <div class="inline-flex items-center justify-center w-16 h-16 bg-blue-100 dark:bg-blue-900 rounded-full mb-4">
                <UIcon :name="feature.icon" class="w-8 h-8 text-blue-600 dark:text-blue-400" />
              </div>
              <h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-2">
                {{ feature.title }}
              </h3>
              <p class="text-gray-600 dark:text-gray-300">
                {{ feature.description }}
              </p>
            </div>
          </UCard>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer class="bg-gray-50 dark:bg-gray-900 py-12">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <p class="text-gray-600 dark:text-gray-400">
            © 2025 Modern Web Uygulaması. Tüm hakları saklıdır.
          </p>
        </div>
      </div>
    </footer>
  </div>
</template>