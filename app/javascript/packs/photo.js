import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

// const handleHeartDisplay = (hasLiked) => {
//   if (hasLiked) {
//     $('.active-heart').removeClass('hidden')
//   } else {
//     $('.inactive-heart').removeClass('hidden')
//   }
// }

document.addEventListener('turbolinks:load', () => {

  // axios.get(`/api/photos/${photoId}/like`)
  //   .then((response) => {
  //     const hasLiked = response.data.hasLiked
  //     handleHeartDisplay(hasLiked)
  //   })

  $('.inactive-heart').on('click', (e) => {
    e.preventDefault();// このclickイベントに関して「preventDefault」する。デフォルトの動作をキャンセルする。
    const id = $(e.currentTarget).attr('id')
    axios.post(`/api/photos/${id}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $(`.active-heart.${id}`).removeClass('hidden')
          $(`.inactive-heart.${id}`).addClass('hidden')
          const likeCount = response.data.likeCount
          // like_countクラス内のspan要素の中身を空にする。
          $(`.like_count.${id} > span`).html('')
          // 現在いいねの数を表示する。
          $(`.like_count.${id} > span`).append(
            `${likeCount}`
          )
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active-heart').on('click', (e) => {
    e.preventDefault();// このclickイベントに関して「preventDefault」する。デフォルトの動作をキャンセルする。
    const id = $(e.currentTarget).attr('id')
    axios.delete(`/api/photos/${id}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $(`.active-heart.${id}`).addClass('hidden')
          $(`.inactive-heart.${id}`).removeClass('hidden')
          const likeCount = response.data.likeCount
          // like_countクラス内のspan要素の中身を空にする。
          $(`.like_count.${id} > span`).html('')
          // 現在いいねの数を表示する。
          $(`.like_count.${id} > span`).append(
            `${likeCount}`
          )
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
})
