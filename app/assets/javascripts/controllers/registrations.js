// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('#usuario_endereco_attributes_cep').mask('99999-999');
$('#usuario_data_nascimento').mask('00/00/0000');

function consultar_cep( cep, logradouro, bairro, uf, cidade, numero){
  $.ajax({
    method: "GET",
    url: "/ceps",
    data: { cep: cep }
  })
    .done(function( retorno ) {
      console.log(retorno)
      if ( retorno.erro ) {
        alert( "CEP Inválido !" );
        logradouro.val( "" );
        bairro.val( "" );
        uf.val( "" );
        cidade.val( "" );
      } else {
        logradouro.val( retorno.logradouro );
        bairro.val( retorno.bairro );
        uf.val( retorno.uf );
        cidade.val( retorno.localidade );
        numero.focus();
      }
      logradouro.prop( 'readonly', true );
      bairro.prop( 'readonly', true );
      uf.prop(     'readonly', true );
      cidade.prop( 'readonly', true );

      if ( logradouro.val() ==  '' ){ logradouro.prop('readonly', null) }
      if ( bairro.val() ==  '' ){     bairro.prop( 'readonly', null);   }
      if ( uf.val() ==  '' ){         uf.prop( 'readonly', null);       }
      if ( cidade.val() ==  '' ){     cidade.prop( 'readonly', null);   }
    });
}


$(function() { 
  //  Utilizada no Editar Perfil ( /perfil ), para consultar o cep
  var cep        = $("#usuario_endereco_attributes_cep");
  var logradouro = $("#usuario_endereco_attributes_logradouro");
  var bairro     = $("#usuario_endereco_attributes_bairro");
  var uf         = $("#usuario_endereco_attributes_uf");
  var numero     = $("#usuario_endereco_attributes_numero");
  var cidade     = $("#usuario_endereco_attributes_nome_cidade");
  if (cep.length > 0) {
    cep.change(function(){ 
      var cep_numbers = cep.val().replace(/\D/g,'');    
      if ( cep_numbers.length == 8 ) {
        consultar_cep(cep_numbers, logradouro, bairro, uf, cidade, numero);
      }
    });
  }
  // Mascara do CPF CNPJ do usuario
  if ( $(':input[id=usuario_cpf_cnpj]').length > 0 ){
    //$(':input[id=usuario_cpf_cnpj]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions)
  }

  // Mascara do CPF CNPJ do usuario
  if ( $(':input[id=usuario_telefone]').length > 0 ){
    $(':input[id=usuario_telefone]').mask(TelCelMaskBehavior, telCelOptions)
  }
  if ( $(':input[id=usuario_celular]').length > 0 ){
    $(':input[id=usuario_celular]').mask(TelCelMaskBehavior, telCelOptions)
  }
})
//  Utilizada no Editar Perfil ( /perfil ), para mostrar o modal do check box de email
function handleAcesso() {
  var checkBox = document.getElementById("usuario_acesso_mondrian_permitido");
  if (checkBox.checked == true){
    $("#usuario_acesso_mondrian_permitido").prop("checked", false);
    $('#acesso_mondrian').modal('toggle');
  }
}