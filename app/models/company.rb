class Company < ActiveRecord::Base
  attr_accessible :name, :foundation, :employers, :published, :slogan, :swat, :brand_ids, :category_ids

  validates_presence_of :name

  has_many :reviews
  has_many :offers

  has_and_belongs_to_many :brands
  has_and_belongs_to_many :categories

  belongs_to :country


end
