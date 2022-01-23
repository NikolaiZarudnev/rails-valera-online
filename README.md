# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Postgrsql-setup:
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postgresql postgresql-contrib libpq-dev
username: postgres
password: postgres


how to create controller:
app/controllers
rails g controller Names
rails g controller Students

how to create model:
app/models
rails g model Student result:integer
rails g model Name my_name:string student:references

references - eto svyaz modeley

rails g controller Conditions
rails g controller Sessions
rails g controller Users
rails g controller ValeraActions

rails g model User email:string name:string password_digest:string health:integer i tak dalee
rails g model ValeraAction
rails g model Condition attr_name:string ....... ValeraAction:references

  create_table "conditions", force: :cascade do |t|
    t.string "attr_name"
    t.integer "min"
    t.integer "max"
    t.string "attr_name_eff"
    t.integer "value_eff"
    t.bigint "valera_action_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["valera_action_id"], name: "index_conditions_on_valera_action_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.integer "health"
    t.integer "alcohol"
    t.integer "happy"
    t.integer "tired"
    t.integer "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "valera_actions", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "alcohol"
    t.integer "happy"
    t.integer "tired"
    t.integer "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

rails db:create
rails db:migrate #eto posle sozdania model

rails server #zapusk 