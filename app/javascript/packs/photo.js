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

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}

const appendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class="comment_detail">
      <div class="comments_user">
        <img class='comments_user_avatar' src="${comment.user.avatar_comment_image}">
      </div>
      <div class="comments_name">
        <p>${comment.user.username}</p>
      </div>
      <div class="photo-comment">
        <p>${comment.content}</p>
      </div>
    </div>`
  )
}

document.addEventListener('turbolinks:load', () => {
  // var dataset = $('#photo-show').data()
  // var photoId = dataset.photoId

  // axios.get(`/photos/${photoId}/comments`)
  //   .then((response) => {
  //     const comments = response.data
  //     comments.forEach((comment) => {
  //       appendNewComment(comment)
  //     })
  //   })

  // handleCommentForm()

  $('.add-comment-button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/photos/${photoId}/comments`, {
        comment: { content: content }
      })
        .then((res) => {
          const comment = res.data
          appendNewComment(comment)
          $('#comment_content').val('')
        })
    }
  })

  // axios.get(`/photos/${photoId}/like`)
  //   .then((response) => {
  //     const hasLiked = response.data.hasLiked
  //     handleHeartDisplay(hasLiked)
  //   })

  $('.inactive-heart').on('click', (e) => {
    e.preventDefault();
    const id = $(e.currentTarget).attr('id')
    axios.post(`/photos/${id}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $(`.active-heart.${id}`).removeClass('hidden')
          $(`.inactive-heart.${id}`).addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active-heart').on('click', (e) => {
    e.preventDefault();
    const id = $(e.currentTarget).attr('id')
    axios.delete(`/photos/${id}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $(`.active-heart.${id}`).addClass('hidden')
          $(`.inactive-heart.${id}`).removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
})
