class Category < ActiveRecord::Base
  attr_accessible :name, :rubric_id
  has_and_belongs_to_many :models
  has_and_belongs_to_many :brands

  has_many :companies

  acts_as_nested_set
end
