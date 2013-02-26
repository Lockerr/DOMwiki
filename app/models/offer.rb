class Offer < ActiveRecord::Base
  attr_accessible :advert, :company_id, :conditions, :date_end, :date_start, :header, :publish, :brand_ids, :category_ids, :item_ids



  has_and_belongs_to_many :items, uniq: true
  has_and_belongs_to_many :models, uniq: true
  has_and_belongs_to_many :brands, uniq: true
  has_and_belongs_to_many :categories, uniq: true

  belongs_to :company

  def brand_name=(name)
    self.brands << Brand.find_or_create_by_name(name) if name.presence
  end
  
  def brand_name
    brands.first.name if brands.any?
  end
    

  


end
