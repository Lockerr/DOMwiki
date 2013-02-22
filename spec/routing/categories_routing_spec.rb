require "spec_helper"

describe CategoriesController do
  describe "routing" do

    it 'reoutes to category' do
      get('/foo').should route_to('categories#show',  categories: 'foo')
    end

    it 'reoutes to subcategory' do
      get('/foo/bar').should route_to('categories#show',  categories: 'foo/bar')
    end

    it 'reoutes to subsubcategory' do
      get('/foo/bar/baz').should route_to('categories#show',  categories: 'foo/bar/baz')
    end

    it "routes to #index" do
      get("/categories").should route_to("categories#index")
    end

    it "routes to #new" do
      get("/categories/new").should route_to("categories#new")
    end

    it "routes to #show" do
      get("/categories/1").should route_to("categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/categories/1/edit").should route_to("categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/categories").should route_to("categories#create")
    end

    it "routes to #update" do
      put("/categories/1").should route_to("categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/categories/1").should route_to("categories#destroy", :id => "1")
    end

  end
end
