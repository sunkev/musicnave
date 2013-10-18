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

      var direction = "";
      if (message.sender_id.toString() === idx) {
        direction = "right";
      }
      else {
        direction = 'left';
      }

      if (message.sender_photo === "blank-profile-hi.png") {
        message.sender_photo = "/assets/blank-profile-hi-small.png";
      }

      $('#message-container').append('<div class=js-message-container id='+direction+'>' +
        '<div class=inner-message ><img src="'+message.sender_photo+'"/>' +
        '<p>' + message.sender_name + '</p> </div>' +
        '<blockquote class=block> </p>' + message.body + '</p>  </blockquote> </div>');
      // $('#message-container').append(message.sender_name);
      // $('#message-container').append(message.body + '</div>');
     });
  }, "json" );
}