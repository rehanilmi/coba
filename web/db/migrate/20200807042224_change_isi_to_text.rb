class ChangeIsiToText < ActiveRecord::Migration[6.0]
  def change
    remove_column :pesans, :pesan_isi
    add_column :pesans, :pesan_isi, :text
  end
end
