$(document).ready ->
  if $('#dute_enviar').size() > 0
    dute_id = $('#dute_enviar').attr('data-dute-id')
    App.room_dute = App.cable.subscriptions.create({
      channel: 'DuteEnviarChannel'
      dute_id: dute_id
    },
      connected: ->
        console.log 'conectado'
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        console.log data
        $('#dute_enviar .meter span').css 'width', data['progress'] + '%'
        $('#dute_enviar .dute-enviar-head').html data['message']
        if data['image']
          window.location.href = '/cartorio/informacao/dutes/' + dute_id + '/informar_imagem'
        if data['success']
          window.location.href = '/cartorio/dutes/' + dute_id + '?mensagem=true'
        if data['error']
          window.location.href = '/cartorio/informacao/dutes/' + dute_id + '/conferir_comunicacao_venda?error=' + escape(data['message'])
      speak: (message) ->
        @perform 'speak', message: message
    )
