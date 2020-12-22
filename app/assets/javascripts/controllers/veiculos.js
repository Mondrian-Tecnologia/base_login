// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  if ( $(':input[id=veiculo_cpf_vendedor]').length > 0 ){
    $(':input[id=veiculo_cpf_vendedor]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions)
  }
})