class CreatePengumumen < ActiveRecord::Migration[6.0]
  def change
    create_table :pengumumen do |t|
      t.string :judul
      t.text :isi

      t.timestamps
    end
  end
end
