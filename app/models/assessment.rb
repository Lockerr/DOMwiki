class Assessment < ActiveRecord::Base
  attr_accessible :assessment, :category_id, :description, :name

  belongs_to :category

end
