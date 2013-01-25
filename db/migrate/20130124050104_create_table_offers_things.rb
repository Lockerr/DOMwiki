class CreateTableOffersThings < ActiveRecord::Migration
  def change
    create_table :items_offers, id: false do |t|
      t.integer :offer_id
      t.integer :item_id
    end
  end
end
