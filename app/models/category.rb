class Category < ActiveRecord::Base
  attr_accessible :name, :rubric_id, :parent_id, :description, :assessments_attributes, :mistakes_attributes, :brand_ids
  
  has_and_belongs_to_many :models
  has_and_belongs_to_many :brands
  has_and_belongs_to_many :reviews
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :items

  has_many :assessments
  has_many :mistakes

  accepts_nested_attributes_for :assessments
  accepts_nested_attributes_for :mistakes
  

  acts_as_nested_set  

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


end
