import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment_text_area').removeClass('hidden')
  })

  $('.comment_cancel').on('click', () => {
    $('.comment_text_area').addClass('hidden')
    $('.show-comment-form').removeClass('hidden')
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
      <div class="photo_comment">
        <p>${comment.content}</p>
      </div>
    </div>`
  )
}

document.addEventListener('turbolinks:load', () => {
  const dataset = $('#photo-show').data()
  const photoId = dataset.photoId

  axios.get(`/api/photos/${photoId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)
      })
    })

  handleCommentForm()

  $('.add-comment-button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/api/photos/${photoId}/comments`, {
        comment: { content: content }
      })
        .then((res) => {
          const comment = res.data
          appendNewComment(comment)
          $('#comment_content').val('')
        })
    }
  })
})
