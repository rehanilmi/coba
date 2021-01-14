class AddNamaTelponOadm < ActiveRecord::Migration[6.0]
  def change
    add_column :oadms, :oadm_nama, :varchar
    add_column :oadms, :oadm_telepon, :varchar
  end
end
