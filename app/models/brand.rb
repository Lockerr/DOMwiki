class Brand < ActiveRecord::Base
  attr_accessible :country_id, :description, :name, :category_ids, :country_name, :photo_data

  has_one :photo, as: :attachable
  belongs_to :country

  has_many :brand_categories

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :offers, uniq: true
  has_and_belongs_to_many :companies

  has_many :items
  
  default_scope  includes(:country)
  
  accepts_nested_attributes_for :country
  accepts_nested_attributes_for :categories

  def country_name=(name)
    self.country = Country.find_or_create_by_name(name)
  end

  def country_name
    country.try :name
  end

  def photo_data=(data)
    build_photo(data: data)
  end
end
