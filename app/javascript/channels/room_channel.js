// import consumer from "./consumer"

document.addEventListener('turbolinks:load', function () {
  App.room = App.cable.subscriptions.create({
    channel: "RoomChannel",
    room: $('#direct_messages').data('room_id')
  }, {
    connected: function () { },
    disconnected: function () { },
    received: function (data) {
      return $('#direct_messages').append(data['direct_message']);
    },
    speak: function (direct_message) {
      return this.perform('speak', {
        direct_message: direct_message
      });
    }
  });
  return $('#chat-input').on('keypress', function (event) {
    if (event.keyCode === 13) {
      App.room.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});
