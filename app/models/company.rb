class Company < ActiveRecord::Base
  attr_accessible :name, :foundation, :employers, :published, :slogan, :swat, :brand_ids, :category_ids

  validates_presence_of :name

  has_many :offers
  has_and_belongs_to_many :brands
  belongs_to :country
  has_and_belongs_to_many :categories
end
