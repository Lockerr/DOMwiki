class AddIndexesForOffersBrands < ActiveRecord::Migration
  def change
    Offer.find_each do |offer|
      brands = Brand.where(id: offer.brand_ids.uniq)
      offer.brands = []
      offer.brands = brands
    end
    add_index :brands_offers, [:offer_id, :brand_id]
  end
end
