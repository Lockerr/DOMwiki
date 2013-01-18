class Assessment < ActiveRecord::Base
  attr_accessible :assessment, :category_id, :description
end
