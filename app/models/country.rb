class Country < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :brands
  has_many :companies

  

end
