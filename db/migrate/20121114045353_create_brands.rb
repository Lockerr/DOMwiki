class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :country_id
      t.text :desc

      t.timestamps
    end
  end
end
