class Page < ActiveRecord::Base
  attr_accessible :assessment, :body, :bugs, :description, :keywords, :title
end
