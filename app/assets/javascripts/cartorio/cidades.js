function carregarCartoriosDaVez(cidade_id) {
  let div_cartorios = $('#cartorios');
  let table = $('#cartorios table');
  let tbody = table.find('tbody');

  $.ajax({
    method: "POST",
    url: `/sindicato/cidades/${cidade_id}/cartorio_da_vez`,
    beforeSend: function(xhr) {
      div_cartorios.hide();
      tbody.html('');
    }
  })
    .done(function( retorno ) {
      div_cartorios.fadeIn('slow');
      /* popular tbody */
      $.each(retorno, function(index, element){
        tbody.append($('<tr>')
          .append($('<td>').append(element.oficio))
          .append($('<td>').append(element.pontuacao))
          .append($('<td>').append(element.bloqueado ? 'S' : 'N'))
        );
      })
      return true;
    });
}
