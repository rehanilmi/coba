class CreatePesertaas < ActiveRecord::Migration[6.0]
  def change
    create_table :pesertaas do |t|
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

      t.timestamps
    end
  end
end
