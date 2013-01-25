window.brand_ids ||= []

typeahead = $("#offer_items_typeahead").data("typeahead")
source = "<%= Brand.where(:id => (params[:ids].split(',').push @brand.id)).joins(:items).select('items.name').map(&:name).join(',') %>".split(',')
if typeahead
  typeahead.source = source
else
  $("offer_items_typeahead").typeahead source: source
alert(source)

if window.brand_ids.indexOf('<%= @brand.id %>') < 0
  $('#offer_brands_selector').append('<%= j render @brand %>')
  window.brand_ids.push('<%= @brand.id %>')




