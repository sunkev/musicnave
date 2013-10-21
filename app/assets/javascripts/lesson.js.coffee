$ ->
  # enable chosen js
  $('.chosen-students').chosen
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    enable_split_word_search: true,
    search_contains: true,
    width: '400px',
    placeholder_text_multiple: 'Add students to lesson'

$ ->
  # enable chosen js
  $('.chosen-states').chosen
    width: '400px',
    search_contains: true,
    placeholder_text_single: "Choose a state",
    enable_split_word_search: true

