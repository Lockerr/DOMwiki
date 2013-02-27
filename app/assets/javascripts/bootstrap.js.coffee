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

  $('.admin_lead_form').click ->
    $('.admin_lead.modal').modal('show')
