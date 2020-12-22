$(document).ready ->
  if $('#read_log').size() > 0
    repasse_parceiro = $('#read_log').attr('data-repasse-parceiro-id')
    App.room_dute = App.cable.subscriptions.create({
      channel: 'ReadLogChannel'
      repasse_parceiro_id: repasse_parceiro
    },
      connected: ->
        console.log 'conectado'
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        $('#read_log .read-log-head').html data['progress']
        $('#read_log .read-log-body').prepend '<div class=\'log-line mb-2\'>' + data['message'] + '</div>'
        if data['reload'] == true
          window.location.href = '/sindicato/repasse_parceiros/' + $('#read_log').attr('data-repasse-parceiro-id')
    )
