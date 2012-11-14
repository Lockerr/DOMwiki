class Model < ActiveRecord::Base
  attr_accessible :brand_id, :description, :name, :price
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subcategories
  has_and_belongs_to_many :rubrics
end
