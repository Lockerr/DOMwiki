require 'spec_helper'
include Warden::Test::Helpers
# include Devise::TestHelpers

  def login_admin
    before(:each) do
      login FactoryGirl.create(:admin) 
    end
  end
  
  def login_user
    before(:each) do

      user = FactoryGirl.create(:user)
      user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      login user
    end
  end
  
  def login(user)
    login_as user, scope: :user
  end

describe "Categories" do
  login_admin
  describe "GET /categories" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get categories_path
      response.status.should be(200)
    end
  end
end
