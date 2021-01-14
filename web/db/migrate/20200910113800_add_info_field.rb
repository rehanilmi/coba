class AddInfoField < ActiveRecord::Migration[6.0]
  def change
    add_column :infos, :info_crated_by, :varchar
    add_column :infos, :info_photo, :varchar
  end
end
