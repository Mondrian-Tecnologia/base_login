$(document).ready(function() {
  // $('.placa').mask('AAA0A00');
  // $('#dute_cepend').mask('00000-000');
  // $('#dute_selo').mask('SSSS00000-SSS');
  // $('#dute_selo_comprador').mask('SSSS00000-SSS');
  // $('#dute_numero_selo_registro').mask('SSSS00000-SSS');
  // $('#dute_tutela_cpf').mask('000.000.000-00');
  // $('#dute_curatela_cpf').mask('000.000.000-00');
  // $('#dute_cpf_procurador').mask('000.000.000-00');
  // $('#dute_cpf_procurador_comprador').mask('000.000.000-00');

  if ( $(':input[id=procuracao_cpf_procurador]').length > 0 ){
    $(':input[id=procuracao_cpf_procurador]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions);
  }
})
