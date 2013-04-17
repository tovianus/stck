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

ActiveRecord::Schema.define(:version => 20130417162921) do

  create_table "perusahaans", :force => true do |t|
    t.string   "nama_penanggung"
    t.string   "nama_badan"
    t.string   "alamat_badan"
    t.string   "telepon"
    t.string   "nama_kontak"
    t.string   "kdperusahaan"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "stck_requests", :force => true do |t|
    t.integer  "idperusahaan"
    t.integer  "user_id"
    t.integer  "perusahaan_id"
    t.string   "kepentingan"
    t.string   "merk"
    t.string   "jenis"
    t.string   "model"
    t.integer  "thn_buat"
    t.integer  "thn_rakit"
    t.integer  "jml_cc"
    t.string   "warna"
    t.string   "bbm"
    t.string   "tnkb"
    t.integer  "jml_roda"
    t.string   "no_rangka"
    t.string   "no_mesin"
    t.datetime "tg_mohon"
    t.datetime "tg_persetujuan"
    t.string   "no_daftar"
    t.datetime "tg_daftar"
    t.date     "tg_akhir"
    t.datetime "tg_cetak"
    t.datetime "tg_pembatalan"
    t.string   "kabupaten"
    t.integer  "idranmor"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
