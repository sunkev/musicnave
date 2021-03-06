$('div.side-bar-inner').on('click', function(e) {
  $('div.side-bar-inner').removeClass('on');
  $(e.currentTarget).toggleClass('on');

  var id = this.id;

  getMessage(id);
  setInterval (getMessage(id), 2500);
});

// $(function()
// {
//   $('.user-message-scroll').jScrollPane(
//   {
//     showArrows: true,
//     maintainPosition: true,
//     reinitialiseOnImageLoad: true,
//     verticalDragMinHeight: 120,
//     verticalDragMaxHeight: 75
//     }
//   );

//   $('.private-message-form').bind(
//     'click',
//     function()
//     {
//       api.getContentPane().load(
//         'ajax_content.html',
//         function()
//         {
//           api.reinitialise();
//         }
//       );
//       return false;
//     }
//   );
// });


$('.user-conversation-scroll').jScrollPane(
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
     return false;
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

$(".private-message-form").on("ajax:success", function(e, data, status, xhr){
  var id = $('div.side-bar-inner.on').attr('id');
  getMessage(id);
});
