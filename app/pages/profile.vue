<script lang="ts" setup>
const {clear, fetch, loggedIn, openInPopup, ready, session, user} = useUserSession()
</script>

<template>
  <div class="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md mx-auto">
      <!-- Login durumu -->
      <div v-if="loggedIn" class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="text-center">
          <!-- Avatar -->
          <div class="mx-auto mb-4">
            <img 
              v-if="user?.avatar" 
              :src="user.avatar" 
              :alt="user.fullName || user.userName || 'User'"
              class="h-20 w-20 rounded-full mx-auto object-cover border-4 border-green-100"
            >
            <div 
              v-else
              class="mx-auto flex items-center justify-center h-20 w-20 rounded-full bg-green-100"
            >
              <svg class="h-10 w-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
              </svg>
            </div>
          </div>

          <h1 class="text-2xl font-bold text-gray-900 mb-2">
            Welcome, {{ user?.fullName || user?.userName || 'User' }}!
          </h1>
          
          <!-- User details -->
          <div class="text-gray-600 mb-6 space-y-1">
            <p v-if="user?.userName" class="text-sm">
              <span class="font-medium">Username:</span> @{{ user.userName }}
            </p>
            <p v-if="user?.fullName" class="text-sm">
              <span class="font-medium">Full Name:</span> {{ user.fullName }}
            </p>
          </div>

          <button 
            @click="clear" 
            class="w-full bg-red-600 hover:bg-red-700 text-white font-medium py-2 px-4 rounded-md transition duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2"
          >
            Logout
          </button>
        </div>
      </div>
      
      <!-- Giriş yapmamış durumu -->
      <div v-else class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="text-center">
          <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-gray-100 mb-4">
            <svg class="h-6 w-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
            </svg>
          </div>
          <h1 class="text-2xl font-bold text-gray-900 mb-2">Not logged in</h1>
          <p class="text-gray-600 mb-6">Please sign in to continue</p>
          <a 
            href="/auth/github" 
            class="inline-flex items-center justify-center w-full bg-gray-900 hover:bg-gray-800 text-white font-medium py-2 px-4 rounded-md transition duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2"
          >
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 0C4.477 0 0 4.484 0 10.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0110 4.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.203 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.942.359.31.678.921.678 1.856 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0020 10.017C20 4.484 15.522 0 10 0z" clip-rule="evenodd"></path>
            </svg>
            Login with GitHub
          </a>
          <br>
          <br>
          <a 
            href="/" 
            class="inline-flex items-center justify-center w-full bg-gray-900 hover:bg-gray-800 text-white font-medium py-2 px-4 rounded-md transition duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2"
          >
            Ana Sayfaya Dön
          </a>
          <br>
          <br>
          <a 
            href="/login" 
            class="inline-flex items-center justify-center w-full bg-gray-900 hover:bg-gray-800 text-white font-medium py-2 px-4 rounded-md transition duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2"
          >
            Login Ekranına Dön
          </a>
        </div>
      </div>
    </div>
  </div>
</template>