function portal_init(submitText){
  $('[data-toggle="tooltip"]').tooltip()
  $('.opts-page-2').hide();

  let submitForm = $(".submit-form");
  submitForm.unbind();
  submitForm.click(function(e){
    let enviar = true;
    submitForm.closest('form').find('input.form-control').each(function(index, element){
      if ( element.value.length === 0 ) {
        enviar = false;
        element.focus();
        element.classList.add('is-invalid');
        return false;
      }
      element.classList.remove('is-invalid');
    })

    if (enviar) {
      $(this).html('Aguarde ...');
      e.preventDefault();
      $(this).closest('form').submit();
    } else {
      return false;
    }
  })
  let form = submitForm.closest('form');
  form.unbind();
  form.submit(function () {
    submitForm.html('Aguarde ...');
    $.post(this.action, $(this).serialize(), null, 'script');
    return false;
  });
  if (submitText)
    submitForm.html(submitText);

  $('input.form-control').change(function(e){
    if ( $(this).val().length === 0 ) {
      $(this).focus();
      $(this).addClass('is-invalid');
    } else {
      $(this).removeClass('is-invalid');
    }
  })

  let dute_cpf_cnpj = $(':input[id=dute_cpf_cnpj]');
  if ( dute_cpf_cnpj.length > 0 ){
    dute_cpf_cnpj.mask(CpfCnpjMaskBehavior, cpfCnpjpOptions);
    $(':input[id=dute_chave_validacao]').mask('aaaaaaaaaa');
  }

  if ( $('.table-cartorio').length > 0 ){
    $('.bg-skew').hide();
    $('.bg-elipse').hide();
    $("#cartorios-filiados.top-menu-item").addClass('active');
    consultaCartorios()
  } else {
    adaptarBgSkew();
  }

  let topMenuItem = $(".top-menu-item");
  topMenuItem.click(function(){
    topMenuItem.removeClass('active');
    $(this).addClass('active');
  })

}

$( document ).ready(function() {
  portal_init();
})

