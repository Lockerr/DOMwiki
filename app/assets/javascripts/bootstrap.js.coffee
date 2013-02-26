jQuery ->
  $("a[rel=popover]").click (e) ->
    e.preventDefault()
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()


$ ->
  object_id = $('#object').data('id')
  $('.datepicker').datepicker({language: 'ru', format: 'dd/mm/yyyy'})

  ########### OFFERS BRANDS TYPEAHEAD

  $("#offer_brands_name").live 'change', ->
    console.log @.value
    value = @.value if ($(@).data('source').indexOf(@.value) >= 0)
    if value
      $.ajax
        type: 'put'
        url: "/offers/#{object_id}/brands?brand_name=#{value}"
        success: (data) ->
          $('#offer_brands_selector').append data

  $('#offer_brands_selector .alert button').live 'click', ->
    $.ajax
      type: 'delete'
      url: "/offers/#{object_id}/brands?brand_id=#{$(@).data('id')}"

  #################

  ########### COMPANIES BRANDS TYPEAHEAD

  $("#company_brands_name").live 'change', ->
    console.log @.value
    value = @.value if ($(@).data('source').indexOf(@.value) >= 0)
    if value
      $.ajax
        type: 'put'
        url: "/companies/#{object_id}/brands?brand_name=#{value}"
        success: (data) ->
          $('#company_brands_selector').append data

  $('#company_brands_selector .alert button').live 'click', ->
    $.ajax
      type: 'delete'
      url: "/companies/#{object_id}/brands?brand_id=#{$(@).data('id')}"

  #################

  ##########  OFFERS ITEMS TYPEAHEAD

  $("#offer_items_typeahead").live 'change', ->
    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
    if value
      $.ajax
        type: 'put'
        url: "/offers/#{object_id}/items?item_name=#{value}"
        success: (data) ->
          $('#items_selector').append data



  $('#items_selector .alert button').live 'click', ->
    $.ajax
      type: 'delete'
      url: "/offers/#{object_id}/items?item_id=#{$(@).data('id')}"

  ###################

###########  REVIEWS ITEMS TYPEAHEAD

  $("#review_items_typeahead").live 'change', ->
    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
    if value
      $.ajax
        type: 'put'
        url: "/reviews/#{object_id}/items?item_name=#{value}"
        success: (data) ->
          $('#items_selector').append data



  $('#items_selector .alert button').live 'click', ->
    $.ajax
      type: 'delete'
      url: "/reviews/#{object_id}/items?item_id=#{$(@).data('id')}"

  ###################
############  COMPANIES CATEGORIES TYPEAHEAD

  $("#company_category_name").live 'change', ->
    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
    if value
      $.ajax
        type: 'put'
        url: "/companies/#{object_id}/categories?category_name=#{value}"
        success: (data) ->
          $('#company_categories_selector').append data



  $('#company_categories_selector .alert button').live 'click', ->
    $.ajax
      type: 'delete'
      url: "/companies/#{object_id}/categories?category_id=#{$(@).data('id')}"

  ###################
#
#  $('#review_items_typeahead').live 'change', ->
#    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
#    if value
#      $.ajax
#        url: "/items/1.js?item_name=#{value}"
#
#
#  $('#brands_selector').live 'change', ->
#    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
#    if value
#      $.ajax
#        url: "/brands/1.js?brand_name=#{value}&object=#{$(@).data('model')}"
#
#  $('#categories_selector').live 'change', ->
#    value = @.value if ($(@).data('typeahead').source.indexOf(@.value) >= 0)
#    if value
#      $.ajax
#        url: "/categories/1.js?category_name=#{value}"
#
#  $("#item_brand_name").live 'change', ->
#    console.log @.value if ($(@).data('source').indexOf(@.value) >= 0)