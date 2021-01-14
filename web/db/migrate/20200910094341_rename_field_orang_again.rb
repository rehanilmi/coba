class RenameFieldOrangAgain < ActiveRecord::Migration[6.0]
  def change
    rename_column :orangs, :peserta_nama, :orang_nama
    rename_column :orangs, :peserta_nik, :orang_nik
    rename_column :orangs, :peserta_jk, :orang_jk
    rename_column :orangs, :peserta_tempat_lahir, :orang_tempat_lahir
    rename_column :orangs, :peserta_tanggal_lahir, :orang_tanggal_lahir
    rename_column :orangs, :peserta_alamat, :orang_alamat
    rename_column :orangs, :peserta_nama_ayah, :orang_nama_ayah
    rename_column :orangs, :peserta_nama_ibu, :orang_nama_ibu
    rename_column :orangs, :peserta_telepon, :orang_telepon
    rename_column :orangs, :peserta_tinggi, :orang_tinggi
    rename_column :orangs, :peserta_bb, :orang_bb
    rename_column :orangs, :peserta_gol_darah, :orang_gol_darah
    rename_column :orangs, :peserta_jumlah_saudara, :orang_jumlah_saudara
    rename_column :orangs, :peserta_jarak_sekolah, :orang_jarak_sekolah
    rename_column :orangs, :peserta_bahasa_seharihari, :orang_bahasa_seharihari
    rename_column :orangs, :peserta_kategori, :orang_kategori
    rename_column :orangs, :peserta_status, :orang_status
    rename_column :orangs, :peserta_photo, :orang_photo
    rename_column :orangs, :peserta_username, :orang_username
    rename_column :orangs, :peserta_password, :orang_password
    rename_column :orangs, :peserta_pass_reset_token, :orang_pass_reset_token
    rename_column :orangs, :peserta_jwt_token, :orang_jwt_token
    rename_column :orangs, :peserta_email, :orang_email
    rename_column :orangs, :peserta_passrequest_token, :orang_passrequest_token
  end
end
