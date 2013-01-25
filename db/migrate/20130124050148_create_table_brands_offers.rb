class CreateTableBrandsOffers < ActiveRecord::Migration
  def change
    create_table :brands_offers, id: false do |t|
      t.integer :offer_id
      t.integer :brand_id
    end
  end
end
