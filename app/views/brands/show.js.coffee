window.brand_ids ||= []

unless '<%= params[:object] %>' == 'company'
  typeahead = $("#offer_items_typeahead").data("typeahead")
  

  if typeahead
    typeahead.source = source
  else
    $("offer_items_typeahead").typeahead source: source


if window.brand_ids.indexOf('<%= @brand.id %>') < 0
  $('#<%= params[:object] %>_brands_selector').append('<%= j render @brand %>')
  window.brand_ids.push('<%= @brand.id %>')




