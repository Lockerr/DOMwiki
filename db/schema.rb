# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121114093621) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "brands_categories", :force => true do |t|
    t.integer "brand_id"
    t.integer "category_id"
  end

  add_index "brands_categories", ["brand_id", "category_id"], :name => "index_brands_categories_on_brand_id_and_category_id"

  create_table "brands_rubrics", :force => true do |t|
    t.integer "brand_id"
    t.integer "rubric_id"
  end

  add_index "brands_rubrics", ["brand_id", "rubric_id"], :name => "index_brands_rubrics_on_brand_id_and_rubric_id"

  create_table "brands_subcategories", :force => true do |t|
    t.integer "brand_id"
    t.integer "subcategory_id"
  end

  add_index "brands_subcategories", ["brand_id", "subcategory_id"], :name => "index_brands_subcategories_on_brand_id_and_subcategory_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "rubric_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "models_categories", :force => true do |t|
    t.integer "model_id"
    t.integer "category_id"
  end

  add_index "models_categories", ["model_id", "category_id"], :name => "index_models_categories_on_model_id_and_category_id"

  create_table "models_rubrics", :force => true do |t|
    t.integer "model_id"
    t.integer "rubric_id"
  end

  add_index "models_rubrics", ["model_id", "rubric_id"], :name => "index_models_rubrics_on_model_id_and_rubric_id"

  create_table "models_subcategories", :force => true do |t|
    t.integer "model_id"
    t.integer "subcategory_id"
  end

  add_index "models_subcategories", ["model_id", "subcategory_id"], :name => "index_models_subcategories_on_model_id_and_subcategory_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "assessment"
    t.string   "bugs"
    t.string   "description"
    t.string   "keywords"
    t.text     "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rubrics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
