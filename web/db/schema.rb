# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_10_114111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cobas", force: :cascade do |t|
    t.string "nama"
    t.string "kelas"
    t.string "nim"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contactus", force: :cascade do |t|
    t.string "cu_nama"
    t.string "cu_telepon"
    t.string "cu_email"
    t.string "cu_subjek"
    t.string "cu_pesan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gurus", force: :cascade do |t|
    t.string "guru_nama"
    t.string "guru_tgl_lahir"
    t.string "guru_tempat_lahir"
    t.string "guru_jk"
    t.string "guru_status_kepegawaian"
    t.string "guru_alamat"
    t.string "guru_telepon"
    t.string "guru_email"
    t.string "guru_bidang_studi"
    t.string "guru_pendidikan_terakhir"
    t.string "guru_agama"
    t.string "guru_status_perkawinan"
    t.string "guru_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "infos", force: :cascade do |t|
    t.string "info_judul"
    t.text "info_isi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "info_created_by"
    t.string "info_photo"
  end

  create_table "oadms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "oadm_email"
    t.string "oadm_name"
    t.string "oadm_password"
    t.string "oadm_pass_change_token"
    t.string "google_secret"
    t.string "reset_google_secret_token"
    t.string "two_factor_is_active"
    t.string "oadm_status"
    t.string "oadm_nama"
    t.string "oadm_telepon"
  end

  create_table "orangs", force: :cascade do |t|
    t.string "orang_nama"
    t.string "orang_nik"
    t.string "orang_jk"
    t.string "orang_tempat_lahir"
    t.string "orang_tanggal_lahir"
    t.string "orang_alamat"
    t.string "orang_nama_ayah"
    t.string "orang_nama_ibu"
    t.string "orang_telepon"
    t.string "orang_tinggi"
    t.string "orang_bb"
    t.string "orang_gol_darah"
    t.string "orang_jarak_sekolah"
    t.string "orang_jumlah_saudara"
    t.string "orang_bahasa_seharihari"
    t.string "orang_kategori"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "orang_photo"
    t.string "orang_status"
    t.string "orang_jenjang_pendidikan"
    t.string "orang_username"
    t.string "orang_password"
    t.string "orang_pass_reset_token"
    t.string "orang_jwt_token"
    t.string "orang_email"
    t.string "orang_passrequest_token"
  end

  create_table "pengumumen", force: :cascade do |t|
    t.string "judul"
    t.text "isi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pesans", force: :cascade do |t|
    t.string "pesan_nama_pengirim"
    t.string "pesan_telepon_pengirim"
    t.string "pesan_email_pengirim"
    t.string "pesan_subjek"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "pesan_isi"
  end

  create_table "peserta", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pesertaas", force: :cascade do |t|
    t.string "pesertaa_nama"
    t.string "pesertaa_nik"
    t.string "pesertaa_jk"
    t.string "pesertaa_tempat_lahir"
    t.string "pesertaa_tanggal_lahir"
    t.string "pesertaa_alamat"
    t.string "pesertaa_nama_ayah"
    t.string "pesertaa_nama_ibu"
    t.string "pesertaa_telepon"
    t.string "pesertaa_tinggi"
    t.string "pesertaa_bb"
    t.string "pesertaa_gol_darah"
    t.string "pesertaa_jarak_sekolah"
    t.string "pesertaa_jumlah_saudara"
    t.string "pesertaa_bahasa_seharihari"
    t.string "pesertaa_kategori"
    t.string "pesertaa_photo"
    t.string "pesertaa_status"
    t.string "pesertaa_jenjang_pendidikan"
    t.string "pesertaa_username"
    t.string "pesertaa_password"
    t.string "pesertaa_pass_reset_token"
    t.string "pesertaa_jwt_token"
    t.string "pesertaa_email"
    t.string "pesertaa_passrequest_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stafs", force: :cascade do |t|
    t.string "staf_nama"
    t.string "staf_tgl_lahir"
    t.string "staf_tempat_lahir"
    t.string "staf_jk"
    t.string "staf_status_kepegawaian"
    t.string "staf_alamat"
    t.string "staf_telepon"
    t.string "staf_email"
    t.string "staf_pendidikan_terakhir"
    t.string "staf_agama"
    t.string "staf_status_perkawinan"
    t.string "staf_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
