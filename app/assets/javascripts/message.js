$('div.side-bar-inner').on('click', function(e) {
  $('div.side-bar-inner').removeClass('on');
  $(e.currentTarget).toggleClass('on');

  var id = this.id;
  getMessage(id);

  // setTimeout(function(){alert(message)},300);
});

$('.user-conversation-scroll').jScrollPane(
  {
    showArrows: true,
    verticalDragMinHeight: 120,
    verticalDragMaxHeight: 75
  }
);

$('.user-message-scroll').jScrollPane(
  {
    showArrows: true,
    verticalDragMinHeight: 120,
    verticalDragMaxHeight: 75
  }
);

function getMessage(idx) {
  $('#message-container').html("");

  $.get("/inbox/private_messages/"+idx+".json", function(data) {
     data.forEach(function(message) {
      var final_name = ""
      var final_photo = ""
      // console.log(message.sender_id);
      // console.log(idx);

      // if (message.sender_id.toString() === idx) {
          final_name = message.sender_name;
          if (message.sender_photo === "blank-profile-hi.png") {
            final_photo = "/assets/blank-profile-hi-small.png";
          }
          else {
            final_photo = message.sender_photo;
          }
        // }
      // else {
      //   console.log(message.recipient_photo);
      //   console.log(message.recipient_name);
      //   message.recipient_photo
      //   final_name = message.recipient_name;
      //   if (message.recipient_photo === "blank-profile-hi.png") {
      //     final_photo = "/assets/blank-profile-hi-small.png";
      //   }
      //   else {
      //     final_photo = message.recipient_photo;
      //   }
      // }

      // console.log(final_photo);
      // console.log(final_name);
      $('#message-container').append('<div class=js-message-container>' + '<img src="'+final_photo+'"/>');
      $('#message-container').append(final_name);
      $('#message-container').append(message.body + '</div>');
     });
  }, "json" );
}