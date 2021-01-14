class AddOrangJwtToken < ActiveRecord::Migration[6.0]
  def change
    add_column :orangs, :orang_username, :varchar
    add_column :orangs, :orang_password, :varchar
    add_column :orangs, :orang_pass_reset_token, :varchar
    add_column :orangs, :orang_jwt_token, :varchar 
  end
end
