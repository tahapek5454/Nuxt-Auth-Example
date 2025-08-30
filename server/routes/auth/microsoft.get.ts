export default defineOAuthMicrosoftEventHandler({
  async onSuccess(event, { user, tokens }) {
    await setUserSession(event, {
      user
    })
    return sendRedirect(event, '/profile')
  },
  // Optional, will return a json error and 401 status code by default
  onError(event, error) {
    console.error('Microsoft OAuth error:', error)
    return sendRedirect(event, '/')
  },
})