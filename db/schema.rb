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
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20131019140247) do
=======
ActiveRecord::Schema.define(version: 20131019152425) do
>>>>>>> 1020d4c7f06922237c11b2c6a46954c7e9f5acb1

  create_table "pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
=======
    t.string   "src"
    t.float    "amount"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "bank_account"
    t.string   "routing_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
>>>>>>> 1020d4c7f06922237c11b2c6a46954c7e9f5acb1
  end

end
