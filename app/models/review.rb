class Review < ActiveRecord::Base
  attr_accessible :published, :search,  :publish, :name, :phone, :place, :square, :total_sum, :date1
  attr_accessor :search
end
