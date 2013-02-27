class Company < ActiveRecord::Base
  attr_accessible :name, :foundation, :employers,
                  :published, :slogan, :swat, :brand_ids, :category_ids,
                  :ceo_description, :ceo_since, :ceo_photo_data,
                  :cto_description, :cto_since, :cto_photo_data,
                  :sales_description, :sales_since, :sales_photo_data,
                  :fourth_description, :fourth_since, :fourth_photo_data



  has_one :cto_photo, class_name: 'Photo', as: :attachable, conditions: {photo_type: :cto_photo}
  has_one :ceo_photo, class_name: 'Photo', as: :attachable, conditions: {photo_type: :ceo_photo}
  has_one :sales_photo, class_name: 'Photo', as: :attachable, conditions: {photo_type: :sales_photo}
  has_one :fourth_photo, class_name: 'Photo', as: :attachable, conditions: {photo_type: :fourth_photo}

  validates_presence_of :name

  has_many :reviews
  has_many :offers

  has_and_belongs_to_many :brands
  has_and_belongs_to_many :categories

  belongs_to :country

  def cto_photo_data=(data)
    build_cto_photo(data: data)
  end

  def ceo_photo_data=(data)
    build_ceo_photo(data: data)
  end

  def fourth_photo_data=(data)
    build_fourth_photo(data: data)
  end

  def sales_photo_data=(data)
    build_sales_photo(data: data)
  end

end
