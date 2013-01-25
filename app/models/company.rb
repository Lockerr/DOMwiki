class Company < ActiveRecord::Base
  attr_accessible :name

  belongs_to :category
  
  has_and_belongs_to_many :categories

end
