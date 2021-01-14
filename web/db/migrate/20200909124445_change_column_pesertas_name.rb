class ChangeColumnPesertasName < ActiveRecord::Migration[6.0]
  def change
    rename_column :pesertas, :orang_nama, :peserta_nama
    rename_column :pesertas, :orang_nik, :peserta_nik
    rename_column :pesertas, :orang_jk, :peserta_jk
    rename_column :pesertas, :orang_tempat_lahir, :peserta_tempat_lahir
    rename_column :pesertas, :orang_tanggal_lahir, :peserta_tanggal_lahir
    rename_column :pesertas, :orang_alamat, :peserta_alamat
    rename_column :pesertas, :orang_nama_ayah, :peserta_nama_ayah
    rename_column :pesertas, :orang_nama_ibu, :peserta_nama_ibu
    rename_column :pesertas, :orang_telepon, :peserta_telepon
    rename_column :pesertas, :orang_tinggi, :peserta_tinggi
    rename_column :pesertas, :orang_bb, :peserta_bb
    rename_column :pesertas, :orang_gol_darah, :peserta_gol_darah
    rename_column :pesertas, :orang_jumlah_saudara, :peserta_jumlah_saudara
    rename_column :pesertas, :orang_jarak_sekolah, :peserta_jarak_sekolah
    rename_column :pesertas, :orang_bahasa_seharihari, :peserta_bahasa_seharihari
    rename_column :pesertas, :orang_kategori, :peserta_kategori
    rename_column :pesertas, :orang_status, :peserta_status
    rename_column :pesertas, :orang_photo, :peserta_photo
  end
end
