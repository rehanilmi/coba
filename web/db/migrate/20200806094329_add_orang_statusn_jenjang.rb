class AddOrangStatusnJenjang < ActiveRecord::Migration[6.0]
  def change
    add_column :orangs, :orang_status, :varchar
    add_column :orangs, :orang_jenjang_pendidikan, :varchar
  end
end
