#encoding: utf-8

class Category < ActiveRecord::Base
  attr_accessible :name, :rubric_id, :parent_id, :description, :assessments_attributes, :mistakes_attributes, :brand_ids, :published, :feed_data, :matrix

  serialize :matrix, OpenStruct

  #validates :validate_matrix, presence: true

  has_many :brand_categories
  has_and_belongs_to_many :models
  has_and_belongs_to_many :brands
  has_and_belongs_to_many :reviews
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :items

  has_many :assessments
  has_many :mistakes

  after_update :publish_parents

  accepts_nested_attributes_for :assessments
  accepts_nested_attributes_for :mistakes

  scope :public, where(published: true)
  acts_as_nested_set

  def brands_feed
    brands.joins(:brand_categories).where("`brands_categories`.`feed` = 1")
  end





  def matrix_brands
    Brand.where(id: matrix.brands)
  end

  def matrix_brand_items(brand)
    matrix(brand).map{|i| Item.find(j)}
  end

  def assessments_attributes=(attributes)
    attributes.each do |key, value|
      Assessment.find(value['id']).update_attributes value.except('id')
    end
  end

  def mistakes_attributes=(attributes)
    attributes.each do |key, value|
      Mistake.find(value['id']).update_attributes value.except('id')
    end
  end

  def publish_parents
    if published
      if parent
        parent.update_attributes published: true
      end
    # else
    #   unless parent.children.public.any?
    #     parent.update_attributes published: false
    #   end
    end
  end

  def feed_data=(hash)
    self.matrix ||= OpenStruct.new
    self.matrix.brands = nil
    self.matrix.items = nil
    hash[:brands].delete ''
    brands = hash[:brands]
    self.matrix.brands = Brand.where(name: brands).map(&:id) unless brands.empty?
    return nil if self.matrix.brands.empty?
    self.matrix.brands.length.times do |i|
      hash[:items][i.to_s].each do |item|
        if i <= self.matrix.brands.size
           self.matrix.items ||= {}
           self.matrix.items[i.to_s] ||= []
           if id = Item.where(name: item.gsub(/\[.+\]\s+/,'')).first
             self.matrix.items[i.to_s].push id.id
           else
             self.matrix.items[i.to_s].push nil
           end
        end
      end
    end
    #raise
  end

  #def validate_matrix
  #  errors.add(:base, 'brands empty') unless matrix.brands
  #  raise
  #end
end
