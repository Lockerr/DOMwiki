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

ActiveRecord::Schema.define(:version => 20130227052536) do

  create_table "assessments", :force => true do |t|
    t.integer  "category_id"
    t.boolean  "assessment"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
  end

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "country_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "brands_categories", :force => true do |t|
    t.integer "brand_id"
    t.integer "category_id"
  end

  add_index "brands_categories", ["brand_id", "category_id"], :name => "index_brands_categories_on_brand_id_and_category_id"

  create_table "brands_companies", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "brand_id"
  end

  create_table "brands_offers", :id => false, :force => true do |t|
    t.integer "offer_id"
    t.integer "brand_id"
  end

  add_index "brands_offers", ["offer_id", "brand_id"], :name => "index_brands_offers_on_offer_id_and_brand_id"

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
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "contactor_id"
    t.text     "description"
    t.boolean  "published"
  end

  create_table "categories_companies", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "category_id"
  end

  create_table "categories_items", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "item_id"
  end

  create_table "categories_offers", :id => false, :force => true do |t|
    t.integer "offer_id"
    t.integer "category_id"
  end

  create_table "categories_reviews", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "review_id"
  end

  add_index "categories_reviews", ["category_id", "review_id"], :name => "index_categories_reviews_on_category_id_and_review_id"
  add_index "categories_reviews", ["review_id", "category_id"], :name => "index_categories_reviews_on_review_id_and_category_id"

  create_table "companies", :force => true do |t|
    t.string   "ceo"
    t.string   "ceo_since"
    t.text     "ceo_description"
    t.string   "cto"
    t.string   "cto_since"
    t.text     "cto_description"
    t.string   "sales"
    t.string   "sales_since"
    t.text     "sales_description"
    t.string   "fourth"
    t.string   "fourth_since"
    t.string   "fourth_description"
    t.string   "name"
    t.date     "foundation"
    t.string   "slogan"
    t.text     "swat"
    t.text     "description"
    t.integer  "employers"
    t.boolean  "published"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price_from"
    t.integer  "price_to"
    t.integer  "brand_id"
    t.string   "partnumber"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "items_offers", :id => false, :force => true do |t|
    t.integer "offer_id"
    t.integer "item_id"
  end

  create_table "items_reviews", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "review_id"
  end

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "mistakes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
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

  create_table "models_offers", :id => false, :force => true do |t|
    t.integer "offer_id"
    t.integer "model_id"
  end

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

  create_table "offers", :force => true do |t|
    t.integer  "company_id"
    t.boolean  "publish"
    t.string   "header"
    t.text     "advert"
    t.date     "date_start"
    t.date     "date_end"
    t.text     "conditions"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "photos", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.string   "photo_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "reviews", :force => true do |t|
    t.boolean  "publish"
    t.string   "name"
    t.string   "phone"
    t.string   "place"
    t.integer  "square"
    t.integer  "total_sum"
    t.date     "date1"
    t.date     "date2"
    t.integer  "csi_id"
    t.integer  "speed",                :limit => 1
    t.integer  "quality",              :limit => 1
    t.integer  "price",                :limit => 1
    t.integer  "response",             :limit => 1
    t.boolean  "recommend"
    t.text     "planning"
    t.date     "planning_time"
    t.boolean  "accept_offers"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.text     "speed_description"
    t.text     "quality_description"
    t.text     "price_description"
    t.text     "response_description"
    t.integer  "company_id"
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

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
