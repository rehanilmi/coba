class ChangePesertasColumnNameTwo < ActiveRecord::Migration[6.0]
  def change
    rename_column :pesertas, :orang_username, :peserta_username
    rename_column :pesertas, :orang_password, :peserta_password
    rename_column :pesertas, :orang_pass_reset_token, :peserta_pass_reset_token
    rename_column :pesertas, :orang_jwt_token, :peserta_jwt_token
    rename_column :pesertas, :orang_email, :peserta_email
    rename_column :pesertas, :orang_passrequest_token, :peserta_passrequest_token
  end
end
