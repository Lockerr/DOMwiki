class Review < ActiveRecord::Base
  attr_accessible :published, :search,  :publish, :name, :phone, :place, :square, :total_sum, :date1, :category_ids
  attr_accessor :search

  has_and_belongs_to_many :categories

  
end
