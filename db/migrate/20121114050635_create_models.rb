class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.integer :brand_id
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
