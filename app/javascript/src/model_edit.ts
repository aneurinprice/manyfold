import '@selectize/selectize'

document.addEventListener('DOMContentLoaded', () => {
  window.tagInputs = []
  $('select[data-selectize]').each(
    function () {
      const tagInput = $(this).selectize({
        addPrecedence: true,
        create: true,
        plugins: ['remove_button']
      })
      window.tagInputs.push(tagInput)
    }
  )
  // Editable names (and other fields):
  $('[contenteditable=true]').focus(function () {
    $(this).data('initialText', $(this).text().trim())
  })
  $('[contenteditable=true]').blur(async function () {
    if ($(this).data('initialText') !== $(this).text().trim()) {
      console.log($(this).data('field'), ' changed: ', $(this).text().trim())
      const postvar: any = {}
      postvar[$(this).data('field')] = $(this).text().trim()
      postvar._method = 'patch'
      postvar.authenticity_token = $('meta[name="csrf-token"]').attr('content')
      await $.post($(this).data('path'), postvar, function (result) { console.log(result.status) }).promise()
    }
  })
})
