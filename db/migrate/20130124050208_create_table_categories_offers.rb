class CreateTableCategoriesOffers < ActiveRecord::Migration
  def change
    create_table :categories_offers, id: false do |t|
      t.integer :offer_id
      t.integer :category_id
    end
  end
end
