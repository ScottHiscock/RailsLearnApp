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

ActiveRecord::Schema.define(:version => 20130713095035) do

  create_table "addresses", :force => true do |t|
    t.string   "name",                                     :null => false
    t.string   "surname",                                  :null => false
    t.string   "city",                                     :null => false
    t.string   "street",                                   :null => false
    t.integer  "postcode",                                 :null => false
    t.string   "state",      :default => "Czech Republic", :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "user_id"
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "categories", :force => true do |t|
    t.integer  "category_id"
    t.string   "name",        :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories", ["category_id"], :name => "index_categories_on_supercategory_id"

  create_table "companies", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "ico",        :null => false
    t.integer  "dic"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "companies", ["user_id"], :name => "index_companies_on_user_id"

  create_table "employees", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "password_hash",                      :null => false
    t.string   "password_salt",                      :null => false
    t.string   "role",          :default => "admin", :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "payment_address_id",                                 :null => false
    t.integer  "delivery_address_id",                                :null => false
    t.integer  "user_id",                                            :null => false
    t.string   "payment_type",                                       :null => false
    t.string   "delivery_type",                                      :null => false
    t.decimal  "total_price",         :precision => 10, :scale => 0, :null => false
    t.boolean  "status",                                             :null => false
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "orders", ["delivery_address_id"], :name => "index_orders_on_delivery_address_id"
  add_index "orders", ["payment_address_id"], :name => "index_orders_on_payment_address_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "name",                                                         :null => false
    t.text     "description"
    t.decimal  "price",       :precision => 10, :scale => 0,                   :null => false
    t.integer  "quantity"
    t.string   "image_path"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.boolean  "active",                                     :default => true
    t.integer  "discount"
    t.string   "image"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "products_orders", :force => true do |t|
    t.integer  "product_id", :null => false
    t.integer  "order_id",   :null => false
    t.integer  "quantity",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "products_orders", ["order_id"], :name => "index_products_orders_on_order_id"
  add_index "products_orders", ["product_id"], :name => "index_products_orders_on_product_id"

  create_table "users", :force => true do |t|
    t.string   "email",                             :null => false
    t.integer  "telephone"
    t.string   "activation_key",                    :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "activated",      :default => false, :null => false
    t.string   "password_salt",                     :null => false
    t.string   "password_hash"
  end

end
