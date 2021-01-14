class ChangeTableOrangsName < ActiveRecord::Migration[6.0]
  def change
    rename_table :orangs, :pesertas
  end
end
