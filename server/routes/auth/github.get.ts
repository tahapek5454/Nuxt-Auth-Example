export default defineOAuthGitHubEventHandler({
  async onSuccess(event, { user, tokens }) {
    await setUserSession(event, {
      user:{
        avatar:user.avatar_url,
        userName:user.login,
        fullName:user.name,
      }
    })
    return sendRedirect(event, '/profile')
  },
  // Optional, will return a json error and 401 status code by default
  onError(event, error) {
    console.error('GitHub OAuth error:', error)
    return sendRedirect(event, '/')
  },
})