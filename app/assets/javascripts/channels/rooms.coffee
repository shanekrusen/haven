jQuery(document).on 'turbolinks:load', -> 
  console.log('coffeescript is running')
  messages = $('#messages')
  if $('#messages').length > 0
    console.log('Running first if loop')
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->
        # Called when subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()
        console.log('receiving')

      send_message: (message, chat_room_id) -> 
        @perform 'send_message', message: message, chat_room_id: chat_room_id

    $('#new_message').submit (e) ->
      console.log('Running submit function')
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
        console.log(messages.data('chat-room-id'))
        textarea.val('')
      e.preventDefault()
      return false