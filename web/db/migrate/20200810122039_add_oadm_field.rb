class AddOadmField < ActiveRecord::Migration[6.0]
  def change
    add_column :oadms, :oadm_email, :varchar
    add_column :oadms, :oadm_name, :varchar
    add_column :oadms, :oadm_password, :varchar
    add_column :oadms, :oadm_pass_change_token, :varchar
    add_column :oadms, :google_secret, :varchar
    add_column :oadms, :reset_google_secret_token, :varchar
    add_column :oadms, :two_factor_is_active, :varchar
    add_column :oadms, :oadm_status, :varchar
  end
end
