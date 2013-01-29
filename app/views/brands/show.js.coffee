brand_ids = []
$(".brand").each ->
  brand_ids.push @id

window.brand_ids ||= []

if '<%= params[:object] %>' == 'offer'
  typeahead = $("#offer_items_typeahead").data("typeahead")


  if typeahead
    typeahead.source = source
  else
    $("offer_items_typeahead").typeahead source: source

  $("offer_items_typeahead").typeahead source: source

if brand_ids.indexOf('<%= @brand.id %>') < 0
  $('#<%= params[:object] %>_brands_selector').append("<%= j render partial: 'brand', locals:{brand: @brand, object: params[:object]} %>")
  window.brand_ids.push('<%= @brand.id %>')





