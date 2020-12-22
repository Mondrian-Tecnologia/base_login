// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#dado_cartorario_cartorio_cep').mask('99999-999');
$('#dado_cartorario_cep').mask('99999-999');
$('#dado_cartorario_cartorio_numero').mask('999999');
$('#dado_cartorario_codigo_agencia').mask('000000009');
$('#dado_cartorario_conta_corrente').mask('000000009');
$('#dado_cartorario_titular_cpf').mask('999.999.999-99');
$(function() {
  if ( $(':input[id=dado_cartorario_cartorio_cnpj]').length > 0 ){
    $(':input[id=dado_cartorario_cartorio_cnpj]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions)
  }
  if ( $(':input[id=dado_cartorario_cpf_cnpj]').length > 0 ){
    $(':input[id=dado_cartorario_cpf_cnpj]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions)
  }
})