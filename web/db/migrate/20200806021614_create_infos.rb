class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string :judul
      t.text :isi

      t.timestamps
    end
  end
end
