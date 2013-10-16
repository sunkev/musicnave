$ ->
  # enable chosen js
  $('.chosen-students').chosen
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    enable_split_word_search: true,
    search_contains: true,
    width: '400px',
    placeholder_text_multiple: 'Add students to lesson'

