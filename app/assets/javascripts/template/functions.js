function jsAutoUpcase(obj){
  this.value = this.value.toUpperCase()
}

function carregarMeter(){
  $('.loader-meter .meter-message').fadeOut();
  $('.loader-meter .meter-confirm').fadeIn();

  alert('ok');
}

function exibirForm(target){
  let ocultar = $('#btn-' + target);
  ocultar.addClass('d-none');

  let exibir = $('#form-' + target);
  exibir.removeClass('d-none');
  exibir.find('input').attr('required', true);
  exibir.find('input.no-required').attr('required', null);
  exibir.children('.card-body').hide();
  exibir.children('.card-body').fadeIn();

  let dute_opt = $('#dute_' + target).first();
  if (dute_opt){
    dute_opt.val(true);
  }
}

function ocultarForm(target){
  let ocultar = $('#form-' + target);
  ocultar.children('.card-body').fadeOut('slow');
  ocultar.find('input').val('');
  ocultar.find('input').attr('required', null);
  ocultar.addClass('d-none');

  $('#btn-' + target).removeClass('d-none');

  ocultar.find('select.tipo_procuracao').selectpicker('destroy');
  ocultar.find('select.tipo_procuracao').selectpicker();

  let dute_opt = $('#dute_' + target).first();
  if (dute_opt){
    dute_opt.val(false);
  }
}

function atualizarValidacoes(target) {
  console.log(target)
  let rtd = target.is(':checked')
  $("#form-bancarios input").each(function (index, element) {
    if (element.id === "") { return; }
    $(this).attr("required", rtd)
  })
  $("#form-bancarios select").each(function (index, element) {
    if (element.id === "") { return; }
    $(this).attr("required", rtd)
  })
  $("#dado_cartorario_digito_agencia").attr("required" , false)
}

function buscarCep(element) {
  let cep = element.val()
  let host = 'http://api-cep.intranet';
  let cep_message = $("#verificacao-cep");

  cep_message.hide();
  cep_message.empty();
  $('.invalid-feedback.d-block').remove();

  console.log(`Buscando ${cep}`);
  if (cep === '' || cep === undefined){
    return
  }

  $.ajax({
    url:  `${host}/api/v1/addresses/search/`,
    data: { 'cep': cep },
    type: 'POST',
    cache: true,
    dataType: 'json',
    timeout: '4000',
    statusCode: {
      200: function(data) {
        console.log(data.address);
        cep_message.empty();
        cep_message.append( tag_post_correios(cep) );
        cep_message.fadeIn('slow');
      },
      201: function(data) {
        console.log(data.address);
        cep_message.empty();
        cep_message.append( tag_post_correios(cep) );
        cep_message.fadeIn('slow');
      },
      400: function(xhr) {
        exibirMsgErro( element, xhr.responseJSON.error );
        console.log(`Falha ao consultar nos CORREIOS: ${xhr.responseJSON.error}`);
        cep_message.append( tag_get_correios() );
        cep_message.fadeIn('slow');
      },
      404: function() {
        cep_message.empty();
        element.removeClass("valid");
        element.removeClass("is-valid");
        element.removeClass("validate");
        element.parent().append(`<div class='invalid-feedback d-block'> CEP não localizado, confira no site dos correios </div>`);
        cep_message.append( tag_get_correios() );
        cep_message.fadeIn('slow');
      }
    }
  }).error(function(xhr){
    if ( xhr.status === 404 || xhr.status === 400 ){
      return;
    }
    cep_message.empty();
    element.parent().append(`<div class='invalid-feedback d-block'> não foi possível consultar o CEP </div>`);
    cep_message.fadeIn('slow');
  })
}

function tag_post_correios(cep){
  let url_correios = 'http://www.buscacep.correios.com.br/sistemas/buscacep/resultadoBuscaCepEndereco.cfm';

  return `<form id='correios-cep' action="${url_correios}" method="post" target="_blank" class="d-inline">
            <input type="hidden" value="${cep}" name="relaxation"/>
            <input type="hidden" value="ALL" name="tipoCEP"/>
            <input type="hidden" value="N" name="semelhante"/>
            <a href="#verificacao-cep" class='scroll-to' onclick="parentNode.submit()" style="text-decoration: none">
              <span class="badge badge-primary mt-1">Confirme nos Correios</span>                    
            </a>
          </form>`
}

function tag_get_correios(){
  let url_correios = 'http://www.buscacep.correios.com.br/sistemas/buscacep/';

  return `<form id='correios-cep' action="${url_correios}" method="get" target="_blank" class="d-inline">
            <a href="#verificacao-cep" class='scroll-to' onclick="parentNode.submit()" style="text-decoration: none">
              <span class="badge badge-danger mt-1">Consulte nos Correios</span>                    
            </a>
          </form>`
}

function loadedPage(){
  setTimeout(function(){
    $('')
    // $('body').addClass('loaded');
  }, 500)
}
