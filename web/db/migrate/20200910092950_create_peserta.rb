class CreatePeserta < ActiveRecord::Migration[6.0]
  def change
    create_table :peserta do |t|

      t.timestamps
    end
  end
end
