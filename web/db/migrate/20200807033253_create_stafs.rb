class CreateStafs < ActiveRecord::Migration[6.0]
  def change
    create_table :stafs do |t|
      t.string :staf_nama
      t.string :staf_tgl_lahir
      t.string :staf_tempat_lahir
      t.string :staf_jk
      t.string :staf_status_kepegawaian
      t.string :staf_alamat
      t.string :staf_telepon
      t.string :staf_email
      t.string :staf_pendidikan_terakhir
      t.string :staf_agama
      t.string :staf_status_perkawinan
      t.string :staf_photo

      t.timestamps
    end
  end
end
