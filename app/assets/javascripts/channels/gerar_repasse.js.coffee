$(document).ready ->
  if $('#acompanhar_repasse').size() > 0
    App.room_dute = App.cable.subscriptions.create({
      channel: 'AcompanharRepasseChannel'
    },
      connected: ->
        console.log 'conectado no AcompanharRepasseChannel'
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        $('#acompanhar_repasse .acompanhar-repasse-head').html data['progress']
        $('#acompanhar_repasse .acompanhar-repasse-body').prepend '<div class=\'log-line mb-2\'>' + data['message'] + '</div>'
        if data['reload'] == true
          window.location.href = '/sindicato/repasses'
    )
