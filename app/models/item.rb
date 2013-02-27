class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price_from, :price_to, :category_ids, :partnumber, :brand_id, :brand_name, :photo_data

  validates_presence_of :name, :brand_id

  belongs_to :brand


  has_one :photo, as: :attachable

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :offers

  def brand_name
    brand.try(:name)
  end

  def brand_name=(name)
    self.brand = Brand.find_or_create_by_name(name) if name.presence
  end

  def photo_data=(data)
    build_photo(data: data)
  end


end
