class ChangeCreatedName < ActiveRecord::Migration[6.0]
  def change
    rename_column :infos, :info_crated_by, :info_created_by
  end
end
