export default defineOAuthMicrosoftEventHandler({
  async onSuccess(event, { user, tokens }) {
    await setUserSession(event, {
      user:{
        avatar:user.avatar_url,
        userName:user.displayName,
        fullName:user.givenName + ' ' + user.surname,
        email: user.mail
      }
    })
    return sendRedirect(event, '/profile')
  },
  // Optional, will return a json error and 401 status code by default
  onError(event, error) {
    console.error('Microsoft OAuth error:', error)
    return sendRedirect(event, '/')
  },
})