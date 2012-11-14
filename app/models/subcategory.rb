class Subcategory < ActiveRecord::Base
  attr_accessible :category_id, :name
  has_and_belongs_to_many :models
  has_and_belongs_to_many :brands
end
