# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111219051211) do

  create_table "items", :force => true do |t|
    t.integer  "user_id"
    t.string   "item_name"
    t.string   "picture"
    t.text     "item_description"
    t.string   "sale_status"
    t.string   "item_list"
    t.boolean  "item_choice"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "offers", :force => true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.boolean  "offer_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "my_item_id"
    t.integer  "public_user_id"
  end

  create_table "recent_activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
