import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleFollowDisplay = (hasFollow) => {
  if (hasFollow) {
    $('.following').removeClass('hidden')
  } else {
    $('.follow').removeClass('hidden')
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

  $('.follow').on('click', () => {
    axios.post(`/accounts/${accountId}/follows`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.following').removeClass('hidden')
          $('.follow').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.following').on('click', () => {
    axios.post(`/accounts/${accountId}/unfollows`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.follow').removeClass('hidden')
          $('.following').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
})
