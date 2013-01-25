class CreateTableModelsOffers < ActiveRecord::Migration
  def change
    create_table :models_offers, id: false do |t|
      t.integer :offer_id
      t.integer :model_id
    end
  end
end
