import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('turbolinks:load', () => {
  $(function () {
    $('.avatar-image').on('click', function () {
      $('#profile-upload').fadeIn();
    });
    $('.btn-primary').on('click', function () {
      $('#profile-upload').fadeOut();
    });
    $('avatar-cancel').on('click', function () {
      $('#profile-upload').fadeOut();
    });
  });
});
