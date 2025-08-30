<script lang="ts" setup>
// Örnek kullanıcı verileri
const user = ref({
  name: 'Ahmet Yılmaz',
  email: 'ahmet.yilmaz@example.com',
  avatar: 'https://ui-avatars.com/api/?name=Ahmet+Yilmaz&background=0ea5e9&color=fff',
  bio: 'Frontend Developer ve Nuxt.js tutkunu. Vue.js ile modern web uygulamaları geliştiriyorum.',
  location: 'İstanbul, Türkiye',
  joinDate: 'Ocak 2023',
  stats: {
    projects: 12,
    followers: 324,
    following: 89
  }
})

// Düzenleme modu
const isEditing = ref(false)
const editForm = ref({ ...user.value })

const toggleEdit = () => {
  if (isEditing.value) {
    // Kaydet
    user.value = { ...editForm.value }
  } else {
    // Düzenleme moduna geç
    editForm.value = { ...user.value }
  }
  isEditing.value = !isEditing.value
}

const cancelEdit = () => {
  editForm.value = { ...user.value }
  isEditing.value = false
}
</script>

<template>
  <div class="max-w-4xl mx-auto p-6 space-y-6">
    <!-- Header -->
    <div class="flex items-center justify-between">
      <h1 class="text-3xl font-bold text-gray-900 dark:text-white">
        Profil
      </h1>
      <UButton
        :color="isEditing ? 'success' : 'primary'"
        :icon="isEditing ? 'i-heroicons-check' : 'i-heroicons-pencil'"
        @click="toggleEdit"
      >
        {{ isEditing ? 'Kaydet' : 'Düzenle' }}
      </UButton>
    </div>

    <!-- Profile Card -->
    <UCard class="overflow-hidden">
      <div class="bg-gradient-to-r from-blue-500 to-purple-600 h-32"></div>
      
      <div class="relative px-6 pb-6">
        <!-- Avatar -->
        <div class="flex justify-center -mt-16 mb-4">
          <UAvatar
            :src="user.avatar"
            :alt="user.name"
            size="3xl"
            class="ring-4 ring-white dark:ring-gray-800"
          />
        </div>

        <!-- User Info -->
        <div class="text-center space-y-4">
          <div v-if="!isEditing">
            <h2 class="text-2xl font-bold text-gray-900 dark:text-white">
              {{ user.name }}
            </h2>
            <p class="text-gray-600 dark:text-gray-400">
              {{ user.email }}
            </p>
          </div>
          
          <div v-else class="space-y-3">
            <UInput
              v-model="editForm.name"
              placeholder="Ad Soyad"
              size="lg"
              class="text-center"
            />
            <UInput
              v-model="editForm.email"
              placeholder="E-posta"
              type="email"
              size="lg"
              class="text-center"
            />
          </div>

          <!-- Bio -->
          <div v-if="!isEditing" class="max-w-md mx-auto">
            <p class="text-gray-700 dark:text-gray-300">
              {{ user.bio }}
            </p>
          </div>
          
          <div v-else>
            <UTextarea
              v-model="editForm.bio"
              placeholder="Hakkında"
              :rows="3"
              class="max-w-md mx-auto"
            />
          </div>

          <!-- Location and Join Date -->
          <div class="flex justify-center items-center space-x-6 text-sm text-gray-500 dark:text-gray-400">
            <div class="flex items-center space-x-1">
              <UIcon name="i-heroicons-map-pin" />
              <span v-if="!isEditing">{{ user.location }}</span>
              <UInput
                v-else
                v-model="editForm.location"
                placeholder="Konum"
                size="sm"
                class="w-32"
              />
            </div>
            <div class="flex items-center space-x-1">
              <UIcon name="i-heroicons-calendar" />
              <span>{{ user.joinDate }} tarihinde katıldı</span>
            </div>
          </div>

          <!-- Cancel Button (Edit Mode) -->
          <div v-if="isEditing" class="pt-2">
            <UButton
              color="neutral"
              variant="ghost"
              @click="cancelEdit"
            >
              İptal
            </UButton>
          </div>
        </div>
      </div>
    </UCard>

    <!-- Stats -->
    <UCard>
      <template #header>
        <h3 class="text-lg font-semibold">İstatistikler</h3>
      </template>
      
      <div class="grid grid-cols-3 gap-6 text-center">
        <div>
          <div class="text-2xl font-bold text-blue-600 dark:text-blue-400">
            {{ user.stats.projects }}
          </div>
          <div class="text-sm text-gray-600 dark:text-gray-400">
            Proje
          </div>
        </div>
        <div>
          <div class="text-2xl font-bold text-green-600 dark:text-green-400">
            {{ user.stats.followers }}
          </div>
          <div class="text-sm text-gray-600 dark:text-gray-400">
            Takipçi
          </div>
        </div>
        <div>
          <div class="text-2xl font-bold text-purple-600 dark:text-purple-400">
            {{ user.stats.following }}
          </div>
          <div class="text-sm text-gray-600 dark:text-gray-400">
            Takip
          </div>
        </div>
      </div>
    </UCard>

    <!-- Recent Activity -->
    <UCard>
      <template #header>
        <h3 class="text-lg font-semibold">Son Aktiviteler</h3>
      </template>
      
      <div class="space-y-4">
        <div class="flex items-center space-x-3 p-3 rounded-lg bg-gray-50 dark:bg-gray-800">
          <UIcon name="i-heroicons-code-bracket" class="text-blue-500" />
          <div class="flex-1">
            <p class="text-sm font-medium">Yeni proje oluşturdu</p>
            <p class="text-xs text-gray-500">E-ticaret uygulaması - 2 saat önce</p>
          </div>
        </div>
        
        <div class="flex items-center space-x-3 p-3 rounded-lg bg-gray-50 dark:bg-gray-800">
          <UIcon name="i-heroicons-heart" class="text-red-500" />
          <div class="flex-1">
            <p class="text-sm font-medium">Bir projeyi beğendi</p>
            <p class="text-xs text-gray-500">Vue.js Dashboard - 5 saat önce</p>
          </div>
        </div>
        
        <div class="flex items-center space-x-3 p-3 rounded-lg bg-gray-50 dark:bg-gray-800">
          <UIcon name="i-heroicons-user-plus" class="text-green-500" />
          <div class="flex-1">
            <p class="text-sm font-medium">Yeni bir kullanıcıyı takip etti</p>
            <p class="text-xs text-gray-500">@developer123 - 1 gün önce</p>
          </div>
        </div>
      </div>
    </UCard>

    <!-- Settings -->
    <UCard>
      <template #header>
        <h3 class="text-lg font-semibold">Hesap İşlemleri</h3>
      </template>
      
      <div class="space-y-3">
        <UButton
          color="neutral"
          variant="ghost"
          icon="i-heroicons-cog-6-tooth"
          class="w-full justify-start"
        >
          Hesap Ayarları
        </UButton>
        
        <UButton
          color="neutral"
          variant="ghost"
          icon="i-heroicons-bell"
          class="w-full justify-start"
        >
          Bildirim Tercihleri
        </UButton>
        
        <UButton
          color="neutral"
          variant="ghost"
          icon="i-heroicons-shield-check"
          class="w-full justify-start"
        >
          Gizlilik ve Güvenlik
        </UButton>
        
        <UDivider />
        
        <UButton
          color="error"
          variant="ghost"
          icon="i-heroicons-arrow-right-on-rectangle"
          class="w-full justify-start"
        >
          Çıkış Yap
        </UButton>
      </div>
    </UCard>
  </div>
</template>