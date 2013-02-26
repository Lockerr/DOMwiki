class Review < ActiveRecord::Base
  attr_accessible :published, :search,  :publish, :name, :phone, :place, :square, :total_sum, :date1, :category_ids, :item_ids, :speed_description, :quality_description, :price_description, :response_description, :recommend, :accept_offers, :planning, :planning_time, :speed, :quality, :price, :response
  attr_accessor :search

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :items
  belongs_to :company

  def company_name
    company.try(&:name)
  end

  def company_name=(name)
    company = Company.find_by_name(name)
  end

end

