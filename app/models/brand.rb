class Brand < ActiveRecord::Base
  attr_accessible :country_id, :description, :name, :category_ids, :country_name


  belongs_to :country

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :offers

  has_many :items
  
  accepts_nested_attributes_for :country
  accepts_nested_attributes_for :categories

  def country_name=(name)
    self.country = Country.find_or_create_by_name(name)
  end

  def country_name
    country.try :name
  end

  def categories_attributes=(attributes)
    # raise attributes['0'].inspect
    self.category_ids=attributes['0']['category_ids']
  end
end
