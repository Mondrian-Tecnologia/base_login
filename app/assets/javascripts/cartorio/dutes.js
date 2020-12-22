$(document).ready(function() {
  $('.placa').mask('AAA0A00');
  $('#dute_cepend').mask('00000-000');
  $('#dute_selo').mask('SSSS00000-SSS');
  $('#dute_selo_comprador').mask('SSSS00000-SSS');
  $('#dute_numero_selo_registro').mask('SSSS00000-SSS');
  // $('#dute_tutela_cpf').mask('000.000.000-00');
  // $('#dute_curatela_cpf').mask('000.000.000-00');
  // $('#dute_cpf_procurador').mask('000.000.000-00');
  // $('#dute_cpf_procurador_comprador').mask('000.000.000-00');

  $('#tipo_data').on('change', function() {
    var select_option = $('#tipo_data option:selected').val();

    if (select_option === 2) {
      $('#data_inicial').attr('disabled', true);
      $('#data_final').attr('disabled', true);
      $('#enviado_inicial').attr('disabled', false);
      $('#enviado_final').attr('disabled', false);
      $('#periodo_criacao').hide();
      $('#periodo_protocolo').show();

    } else {
      $('#data_inicial').attr('disabled', false);
      $('#data_final').attr('disabled', false);
      $('#enviado_inicial').attr('disabled', true);
      $('#enviado_final').attr('disabled', true);
      $('#periodo_criacao').show();
      $('#periodo_protocolo').hide();
    }
  })

  if ( $(':input[id=dute_cpf_cnpj]').length > 0 ){
    $(':input[id=dute_cpf_cnpj]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions);
  }

  if ( $(':input[id=dute_cpf_vendedor]').length > 0 ){
    $(':input[id=dute_cpf_vendedor]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions);
  }

  $('#dute-buscar-por').on('change', function() {
    $('#input-buscar-dute').focus();
  })

  var ultimo_cep = null;
  $("#dute_cepend").on('change', function(){
    if ( ultimo_cep !== $(this).val() ){
      ultimo_cep = $(this).val();
      buscarCep( $(this) );
    }
  })

  $("#dute_renav").change(function(){
    let selo_comprador = $("#dute_selo_comprador");
    if ( $(this).prop('checked') ){
      selo_comprador.val('');
      selo_comprador.attr('readonly', true)
    } else {
      selo_comprador.attr('readonly', false)
    }
  })
  $("#dute_selo").keyup(function(){
    $(this).val($(this).val().toUpperCase());
  });
  $("#dute_selo_comprador").keyup(function(){
    $(this).val($(this).val().toUpperCase());
  });
  $("#dute_numero_selo_registro").keyup(function(){
    $(this).val($(this).val().toUpperCase());
  });
  // ClientSideValidations.callbacks.form.pass = function(form, eventData) {
  //   alert(form.find(':input[required=required]').length);
  //   return false;
  // }
})
