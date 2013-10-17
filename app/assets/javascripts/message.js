$('div.side-bar-inner').on('click', function(e) {
  $('div.side-bar-inner').removeClass('on');
  $(e.currentTarget).toggleClass('on');

  var id = this.id;
  getMessage(id);

  // setTimeout(function(){alert(message)},300);
});

$('.user-conversation-scroll').jScrollPane(
  // {
  //   showArrows: true,
  //   }
);

function getMessage(idx) {
  $('#message-container').html("");

  $.get("/inbox/private_messages/"+idx+".json", function(data) {

     data.forEach(function(message) {
        $('#message-container').append('<div class=messages> '+ message.body + ' </div>')


     });
  }, "json" );
}