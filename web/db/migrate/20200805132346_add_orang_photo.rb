class AddOrangPhoto < ActiveRecord::Migration[6.0]
  def change
    add_column :orangs, :orang_photo, :varchar
  end
end
