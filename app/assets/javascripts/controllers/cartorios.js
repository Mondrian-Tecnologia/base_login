// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#cartorio_favorecido_cep').mask('99999-999');
$('#cartorio_cep').mask('99999-999');
$('#cartorio_numero').mask('999999');
$('#cartorio_agencia').mask('000000009');
$('#cartorio_conta').mask('000000009');
$('#cartorio_titular_cpf').mask('999.999.999-99');

$(function() {
  if ( $(':input[id=cartorio_cnpj]').length > 0 ){
    $(':input[id=cartorio_cnpj]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions)
  }
  if ( $(':input[id=cartorio_favorecido_cpf_cnpj]').length > 0 ){
    $(':input[id=cartorio_favorecido_cpf_cnpj]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions)
  }
})