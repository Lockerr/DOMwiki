class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price_from
      t.integer :price_to
      t.integer :brand_id
      t.string  :partnumber

      t.timestamps
    end
  end
end
