$(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip();
  $('select[data-dynamic-selectable-url][data-dynamic-selectable-target]').dynamicSelectable();
  $('.maskMoney').maskMoney({thousands:'.', decimal:',', allowZero:true});

  bsCustomFileInput.init();

  // alterar tabs
  var result = {};
  var tmp = [];

  location.search
      .substr (1)
      .split ("&")
      .forEach (function (item) {
          tmp = item.split ("=");
          result [tmp[0]] = decodeURIComponent (tmp[1]);
      });

  if (result['tab']) {
    let tab = result['tab'];
    
    if ( $(`li.${tab} .nav-link`).size() > 0){
      $(`li .nav-link.active`).removeClass('active');
      $(`li.${tab} .nav-link`).addClass('active');

      $(`div.active.tab-pane`).removeClass('active');
      $(`div.show.tab-pane`).removeClass('show');

      $(`div#${tab}.tab-pane`).addClass('active');
      $(`div#${tab}.tab-pane`).addClass('show');
    }
  }

  let span_meter = $(".meter > span");
  if ( span_meter.size() >= 1 ) {
    span_meter.each(function() {
      $(this)
        .data("origWidth", $(this).width())
        .width(0)
        .animate({
          width: $(this).data("origWidth")
        }, 1200);
    });
  }

  $('form.input-disable :input').attr('disabled', true);

  /* Código jQuery */
  $("a.scroll-to[href='#']").each(function(){
    $(this).click(function(e){
      e.preventDefault();
      $('html,body').animate({ scrollTop: 0 }, 'slow');
      return false;
    });
  });

  // Disabilitar radio buttons com com classe disabled
  $("input[type='radio'].disabled").click(function() { return false; } )
  // ADD PLACEHOLDER QUANDO HOUVER MAXLENGHT
  let inputWithLength = $('input[maxlength]');
  inputWithLength.each(function(index, element){
    if (element.placeholder === '') {
      element.placeholder = "Máximo "+ element.maxLength + " caracteres";
    }
  })

  // Remover Titulo da Categoria quando nao houver itens
  $("#ferramentas .card-body").each(function(index, element){
    console.log( $(this).children().length );
    if ( $(this).children().length === 0 ){
      $(this).parent().remove();
    }
  })
})

paceOptions = {
  // Disable the 'elements' source
  elements: false,
  // Only show the progress on regular and ajax-y page navigation,
  // not every request
  restartOnRequestAfter: false
}


