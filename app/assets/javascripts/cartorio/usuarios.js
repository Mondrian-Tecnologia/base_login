$(document).ready(function() {
  $('#form_cartorio_usuario').on('submit', function() {
    var isDisabled = $('#grupo_id_1').prop('disabled')

    if (isDisabled) {
      $('#grupo_id_1').prop('disabled', false)
      $('#grupo_id_1').prop('checked', true )
    }
  })
})
