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

  $('#private_message_recipient_id').val(idx);

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

      setOrder(direction, message.sender_photo, message.sender_name, message.body);

     });
  }, "json" );
}

function setOrder(direction, image, name, body) {
  if (direction === 'right') {
    $('#message-container').append(
      '<div class=js-message-container id='+direction+'>' +
      '<div class=block>' + body + '</div>' +
      '<div class=inner-message >' +
      '<div class=name>' + name + ' </div>' +
      '<img src="'+image+'"/> ' +
      '</div> </div>'
    );
  }
  else {
    $('#message-container').append(
      '<div class=js-message-container id='+direction+'>' +
      '<div class=inner-message >' +
      '<div class=name>' + name + '</div>' +
      '<img src="'+image+'"/> </div>' +
      '<div class=block>' + body + '</div> </div>'
    );
  }
}

