class ChangeInfoFieldName < ActiveRecord::Migration[6.0]
  def change
    rename_column :infos, :judul, :info_judul
    rename_column :infos, :isi, :info_isi
  end
end
