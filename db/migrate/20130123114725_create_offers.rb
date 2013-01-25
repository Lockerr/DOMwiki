class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :company_id
      t.boolean :publish
      t.string :header
      t.text :advert
      t.date :date_start
      t.date :date_end
      t.text :conditions

      t.timestamps
    end
  end
end
