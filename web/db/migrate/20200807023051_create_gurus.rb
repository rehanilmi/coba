class CreateGurus < ActiveRecord::Migration[6.0]
  def change
    create_table :gurus do |t|
      t.string :guru_nama
      t.string :guru_tgl_lahir
      t.string :guru_tempat_lahir
      t.string :guru_jk
      t.string :guru_status_kepegawaian
      t.string :guru_alamat
      t.string :guru_telepon
      t.string :guru_email
      t.string :guru_bidang_studi
      t.string :guru_pendidikan_terakhir
      t.string :guru_agama
      t.string :guru_status_perkawinan
      t.string :guru_photo

      t.timestamps
    end
  end
end
