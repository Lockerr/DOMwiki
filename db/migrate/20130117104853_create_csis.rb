class CreateCsis < ActiveRecord::Migration
  def change
    create_table :csis do |t|
      
      t.string :ceo
      t.string :ceo_since
      t.text :ceo_description

      t.string :cto
      t.string :cto_since
      t.text  :cto_description

      t.string :sales
      t.string :sale_since
      t.text :sales_description

      t.string :fourth
      t.string :fourth_since
      t.string :fourth_description

      t.string :name

      t.date :foundation
      t.string :slogan
      t.text :swat

      t.text :description

      t.integer :employers

      t.boolean :published

      t.decimal :speed_rating
      t.decimal :quality_rating
      t.decimal :price_rating
      t.decimal :response

      t.timestamps
    end
  end
end
