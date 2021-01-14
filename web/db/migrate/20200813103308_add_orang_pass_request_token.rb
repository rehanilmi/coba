class AddOrangPassRequestToken < ActiveRecord::Migration[6.0]
  def change
    add_column :orangs, :orang_passrequest_token, :varchar
  end
end
