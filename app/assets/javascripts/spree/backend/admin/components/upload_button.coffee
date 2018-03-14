class UploadButton
  constructor: (@form) ->
    @submit = $(@form).find("button[type='submit']")
    @input  = $(@form).find("input[type='file']")

  init: ->
    @submit.on 'click', @selectFile
    @input.on 'change', @submitForm

  selectFile: (e) =>
    e.preventDefault()
    @input.trigger('click')

  submitForm: (e) -> @form.submit()

$(document).ready ->
  $('.js-upload-btn').each ->
    handler = new UploadButton(this)
    handler.init()
