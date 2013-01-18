class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.boolean :publish

      t.string :name
      t.string :phone
      t.string :place
      
      t.integer :square
      t.integer :total_sum
      
      t.date :date1
      t.date :date2
      
      t.integer :csi_id

      t.integer :speed, :limit => 1
      t.integer :quality, :limit => 1
      t.integer :price, :limit => 1
      t.integer :response, :limit => 1

      t.boolean :recommend
      t.text :planning
      t.date :planning_time
      t.boolean :accept_offers


      t.timestamps
    end
  end
end
