#class Category
#  attr_accessor :id
#
#  def initialize
#    @id = 'id'
#  end
#
#  def all
#    HTTP.get '/categories.json' do |response|
#
#      p response.body
#
#      response.body.each do |category|
#        Document['.container'].append category
#      end
#    end
#  end
#end
#
#Document.ready? do
#  cat = Category.new
#  puts cat.id
#  p Document['.container']
#end