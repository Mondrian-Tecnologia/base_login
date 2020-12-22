// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  if ( $(':input[id=usuario_telefone]').length > 0 ){
    $(':input[id=usuario_telefone]').mask(TelCelMaskBehavior, telCelOptions)
  }
  if ( $(':input[id=usuario_cpf]').length > 0 ){
    $(':input[id=usuario_cpf]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions)
  }
})