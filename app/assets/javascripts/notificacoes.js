
var ready;
ready = function () {
  $("#notificacao_botao").on("click", function (event) {
    $('span.badge.info-number.message').fadeOut();
  });
  var ultima_notificacao = $("#notificacao_id").val();
  var interval = 60000;
  function doAjax() {
    $.ajax({
      type: 'get',
      url: '/notificacoes/1/notificacao_json',
      data: $(this).serialize(),
      dataType: 'json',
      success: function (data) {
        var count = 0;
        var mensagem_counter = $("ul#lista_notificacoes li").size();
        var mensagem_counter = parseInt(mensagem_counter)
        noticacoes_sino = $("#noticacoes_count").text();
        noticacoes_sino = parseInt(noticacoes_sino);
        if (data.length > 0) {
          for (var i = 0; i < data.length; i++) {
            if (data[i].id > ultima_notificacao) {
              ultima_notificacao = data[i].id;
              count++;
              $("ul#lista_notificacoes").prepend("<li><a href=" + data[i].link + " " + 'data-original-title="" title=""><div class="hexagon ' + data[i].cor + '"><span><i class="' + data[i].icone + '"></i></span></div><span class="text_info">' + data[i].descricao + '</span><span class="time_info">' + data[i].date_ptBr + "</span></a></li>");
              $("#notificacao_botao").attr("href", "/notificacoes/" + data[i].id + "/ver_notificacoes");
              $("#ver_mais").text("Ver mais");
              $("#ver_mais").attr("href", "/notificacoes");
            }
          }
          if (count > 0) {
            total_noficacoes = mensagem_counter + count
            notificacoes_sino_total = noticacoes_sino + count
            $("span.badge.info-number.message").fadeIn();
            $("#noticacoes_count").text(notificacoes_sino_total);
            if (total_noficacoes > 7) {
              for (i = 0; i < count; i++) {
                $("ul#lista_notificacoes li:last").prev("li").remove();
              }
            }

          }
        }

      },
      complete: function (data) {
        // setTimeout(doAjax, interval);
      }
    });
  }
  // setTimeout(doAjax, interval)
};
$(document).ready(ready);
$(document).on("page:load", ready);
