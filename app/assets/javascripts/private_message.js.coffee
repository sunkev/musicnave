$ ->
  # enable chosen js
  $('.chosen-messages').chosen
    width: '400px',
    search_contains: true,
    placeholder_text_single: "Add recipient",
    enable_split_word_search: true
