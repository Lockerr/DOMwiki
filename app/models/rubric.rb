class Rubric < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :models
  has_and_belongs_to_many :brands
end
