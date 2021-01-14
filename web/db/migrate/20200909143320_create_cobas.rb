class CreateCobas < ActiveRecord::Migration[6.0]
  def change
    create_table :cobas do |t|
      t.string :nama
      t.string :kelas
      t.string :nim

      t.timestamps
    end
  end
end
