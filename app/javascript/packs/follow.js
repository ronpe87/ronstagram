import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleFollowDisplay = (hasFollow) => {
  if (hasFollow) {
    $('.following').removeClass('hidden')
  } else {
    $('.unfollowing').removeClass('hidden')
  }
}

document.addEventListener('turbolinks:load', () => {
  const dataset = $('#account-show').data()
  const accountId = dataset.accountId
  const userId = dataset.userId

  axios.get(`/accounts/${accountId}/follows/${userId}`)
    .then((response) => {
      const hasFollow = response.data.hasFollow
      handleFollowDisplay(hasFollow)
    })
})
