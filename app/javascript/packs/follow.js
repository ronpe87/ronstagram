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

document.addEventListener('DOMContentLoaded', () => {
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
          const followerCount = $(`#follower_count`).text()
          const numFollowerCount = parseInt(followerCount)
          $(`#follower_count`).text(numFollowerCount + 1)
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
          const followerCount = $(`#follower_count`).text()
          const numFollowerCount = parseInt(followerCount)
          $(`#follower_count`).text(numFollowerCount - 1)
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
})
