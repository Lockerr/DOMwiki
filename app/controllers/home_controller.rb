class HomeController < ApplicationController
  def index
    @categories = Category.public.where depth: nil
  end
end
