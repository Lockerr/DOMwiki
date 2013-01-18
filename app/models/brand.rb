class Brand < ActiveRecord::Base
  attr_accessible :country_id, :desc, :name

  has_and_belongs_to_many :categories
  # has_and_belongs_to_many :subcategories
  # has_and_belongs_to_many :rubrics

end
