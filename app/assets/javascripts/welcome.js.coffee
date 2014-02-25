# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

# Change QR code to Avatar
  origImgURL = ''
  $('.img-cover').hover ->
    origImgURL = this.src
    $(this.id).hide()
    this.src = avatarSrc()
    $(this.id).show()
  , ->
    $(this.id).hide()
    this.src = origImgURL
    $(this.id).show()

# Gen random avatar id
  randomAvatarId = () ->
    Math.floor(Math.random() * 76 + 1)

# Gen avatar src address
  avatarSrc = () ->
    '/assets/avatars/' + randomAvatarId() + '.jpg'
