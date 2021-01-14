class CreateOrangs < ActiveRecord::Migration[6.0]
  def change
    create_table :orangs do |t|
      t.string :orang_nama
      t.string :orang_nik
      t.string :orang_jk
      t.string :orang_tempat_lahir
      t.string :orang_tanggal_lahir
      t.string :orang_alamat
      t.string :orang_nama_ayah
      t.string :orang_nama_ibu
      t.string :orang_telepon
      t.string :orang_tinggi
      t.string :orang_bb
      t.string :orang_gol_darah
      t.string :orang_jarak_sekolah
      t.string :orang_jumlah_saudara
      t.string :orang_bahasa_seharihari
      t.string :orang_kategori

      t.timestamps
    end
  end
end
