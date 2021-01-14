class AddOrangEmail < ActiveRecord::Migration[6.0]
  def change
    add_column :orangs, :orang_email, :varchar
  end
end
