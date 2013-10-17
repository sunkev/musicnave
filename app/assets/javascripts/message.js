$('div.side-bar-inner').on('click', function(e) {
  $('div.side-bar-inner').removeClass('on');
  $(e.currentTarget).toggleClass('on');
})

$('.user-conversation-scroll').jScrollPane(
  // {
  //   showArrows: true,
  //   }
);