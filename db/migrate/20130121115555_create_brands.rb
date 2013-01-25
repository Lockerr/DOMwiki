class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.integer :country_id
      t.date :foundation
      t.boolean :public
      

      t.timestamps
    end
  end
end
