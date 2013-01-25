class Mistake < ActiveRecord::Base
  attr_accessible :description, :name, :category_id

  belongs_to :category
end
