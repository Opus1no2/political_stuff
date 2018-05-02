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

ActiveRecord::Schema.define(version: 20180501234249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "congresses", force: :cascade do |t|
    t.integer "session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session"], name: "index_congresses_on_session", unique: true
  end

  create_table "senators", force: :cascade do |t|
    t.bigint "congress_id"
    t.string "api_id"
    t.string "title"
    t.string "short_title"
    t.string "api_uri"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "suffix"
    t.string "date_of_birth"
    t.string "gender"
    t.string "party"
    t.string "leadership_role"
    t.string "twitter_account"
    t.string "facebook_account"
    t.string "youtube_account"
    t.boolean "in_office"
    t.integer "seniority"
    t.integer "next_election"
    t.integer "total_votes"
    t.integer "missed_votes"
    t.integer "total_present"
    t.string "office"
    t.string "phone"
    t.string "fax"
    t.string "state"
    t.integer "senate_class"
    t.integer "state_rank"
    t.float "missed_votes_pct"
    t.float "votes_with_party_pct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_id"], name: "index_senators_on_api_id", unique: true
    t.index ["congress_id"], name: "index_senators_on_congress_id"
  end

end
