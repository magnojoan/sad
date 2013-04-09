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

ActiveRecord::Schema.define(:version => 20130409054532) do

  create_table "adjustments", :force => true do |t|
    t.integer  "entry_id"
    t.integer  "product_id"
    t.string   "price_difference_type"
    t.decimal  "difference_amount",     :precision => 10, :scale => 0
    t.date     "month_in_effect"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "customers", :force => true do |t|
    t.integer  "customer_id"
    t.string   "customer_name"
    t.string   "customer_address"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "deliveryaddresses", :force => true do |t|
    t.integer  "delivery_address_id"
    t.string   "delivery_address"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "lots", :force => true do |t|
    t.string   "lot_no"
    t.integer  "product_id"
    t.date     "expiry_date"
    t.string   "inventory_status"
    t.integer  "quantity"
    t.decimal  "lot_cost",         :precision => 10, :scale => 0
    t.decimal  "unit_cost",        :precision => 10, :scale => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "orderlists", :force => true do |t|
    t.integer  "orderlist_code"
    t.integer  "order_id"
    t.integer  "lot_id"
    t.integer  "quantity"
    t.string   "tin_no"
    t.decimal  "net_amount",     :precision => 10, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "invoice_no"
    t.integer  "purchase_order_no"
    t.date     "date"
    t.string   "terms"
    t.decimal  "subtotal",          :precision => 10, :scale => 0
    t.decimal  "vatable_amount",    :precision => 10, :scale => 0
    t.decimal  "total",             :precision => 10, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "product_code"
    t.integer  "product_version"
    t.string   "product_name"
    t.decimal  "reorder_level",   :precision => 10, :scale => 0
    t.boolean  "is_enabled"
    t.date     "effective_date"
    t.decimal  "unit_price",      :precision => 10, :scale => 0
    t.string   "unit_type"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
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
    t.string   "username"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
