jQuery ->
  $("a[rel=popover]").click (e) ->
    e.preventDefault()
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()


$ ->
  $("#item_brand_name").live 'change', ->
    console.log @.value if ($(@).data('source').indexOf(@.value) >= 0)

  $("#offer_brands_name").live 'change', ->
    console.log @.value
    value = @.value if ($(@).data('source').indexOf(@.value) >= 0)
    if value
      $.ajax
        url: "/brands/1.js?brand_name=#{value}"
  # $("#offer_items_name").live 'change', ->