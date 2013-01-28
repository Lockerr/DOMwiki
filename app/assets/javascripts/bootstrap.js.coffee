jQuery ->
  $("a[rel=popover]").click (e) ->
    e.preventDefault()
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()


$ ->
  $('.datepicker').datepicker({language: 'ru', format: 'dd/mm/yyyy'})
  
  $("#item_brand_name").live 'change', ->
    console.log @.value if ($(@).data('source').indexOf(@.value) >= 0)

  $("#offer_brands_name").live 'change', ->
    console.log @.value
    value = @.value if ($(@).data('source').indexOf(@.value) >= 0)
    if value
      $.ajax
        url: "/brands/1.js?brand_name=#{value}&ids=#{window.brand_ids}"
  
  $("#offer_items_typeahead").live 'change', ->
    console.log @.value
    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
    if value
      $.ajax
        url: "/items/1.js?item_name=#{value}" 

  $('#review_items_typeahead').live 'change', ->
    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
    if value
      $.ajax
        url: "/items/1.js?item_name=#{value}"


  $('#brands_selector').live 'change', ->
    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
    if value
      $.ajax
        url: "/brands/1.js?brand_name=#{value}&object=#{$(@).data('model')}"

