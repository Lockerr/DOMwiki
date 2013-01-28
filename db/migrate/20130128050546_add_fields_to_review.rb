class AddFieldsToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :speed_description, :text
    add_column :reviews, :quality_description, :text
    add_column :reviews, :price_description, :text
    add_column :reviews, :response_description, :text
  end
end
