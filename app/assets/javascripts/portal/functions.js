// Reajusta altura e posicao da barra lateral
function adaptarBgSkew(){
  posicaoBgSkew();
  alturaBgSkew();
}

// Seta posicao lateral da barra
function posicaoBgSkew() {
  let fullWidth = $(window).width();
  let bgWidht = 200000;

  if (fullWidth > 1200) {
    let right = (fullWidth / 2);
    bgWidht = right + 395;
  } else {
    if (fullWidth > 1000) {
      let right = (fullWidth / 2);
      bgWidht = right + 300;
    }
  }
  $(".bg-skew").css('left', bgWidht + 'px');
}

// Seta Altura da pagina do bg
function alturaBgSkew() {
  let fullHeight = $(window).height()
  // console.log($(window).height());
  // let fullHeight = $(document).height();

  $(".bg-skew").css('height', fullHeight + 'px');
}

// Filtra linhas da tabela que contenha o valor pesquisado
// em /cartorios
function consultaCartorios(){
  $("#table-search").on("keyup", function() {
    let value = $(this).val().toLowerCase();
    $(".table-data tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
}

// Altera para logo branca se ainda nao for
function exibirLogoBranca(){
  let logo = $('#logo-dute.colorida');
  if ( logo.length > 0 ){
    logo.removeClass('colorida').addClass('branca');
  }
}

// Altera para logo colorida se ainda nao for
function exibirLogoColorida(){
  let logo = $('#logo-dute.branca');
  if ( logo.length > 0 ){
    logo.removeClass('branca').addClass('colorida');
  }
}

// Abrir Menu Mobile atravez do icone
function abrirMenuMobile(){
  let menu = $("#menu");

  menu.fadeIn('slow');
}

// Fecha Menu Mobile atravez do icone
function fecharMenuMobile(){
  let menu = $("#menu");

  menu.fadeOut('slow');
}

// Alterna sub-menu (desativado)
function alterarMenu(obj){
  let btn1 = $('.button.opts-page-1');
  let btn2 = $('.button.opts-page-2');

  if ( btn1.css('display') === 'none' ){
    $('.opts-page-2').hide();
    $('.opts-page-1').fadeIn('slow');
  } else {
    $('.opts-page-1').hide();
    $('.opts-page-2').fadeIn('slow');
  }
}

// Alterna Fundo das Pagina para a elipse (home/index)
function alterarBgElipse() {
  let bgSkew = $('.bg-skew');
  if ( bgSkew.length === 0 ){ return false; }

  bgSkew.fadeOut('slow');
  bgSkew.promise().done(function(){
    bgSkew.removeClass('bg-skew').addClass('bg-elipse');
    bgSkew.css('left', '');
    bgSkew.css('width', '');
    bgSkew.css('height', '');
  });
  bgSkew.promise().done(function() {
    $('.bg-elipse').fadeIn('slow');
  })
}

// Alterna Fundo das Pagina para a skew (barra lateral)
function alterarBgSkew(){
  let bgElipse = $('.bg-elipse');
  if ( bgElipse.length === 0 ){ return false; }

  bgElipse.fadeOut('slow');
  bgElipse.promise().done(function(){
    bgElipse.removeClass('bg-elipse').addClass('bg-skew');
    adaptarBgSkew();
  });
  bgElipse.promise().done(function() {
    $('.bg-skew').fadeIn('slow');
  })
}
