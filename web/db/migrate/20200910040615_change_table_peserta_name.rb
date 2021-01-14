class ChangeTablePesertaName < ActiveRecord::Migration[6.0]
  def change
    rename_table :pesertas, :orangs
  end
end
