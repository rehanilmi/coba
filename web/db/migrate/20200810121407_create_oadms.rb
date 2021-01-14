class CreateOadms < ActiveRecord::Migration[6.0]
  def change
    create_table :oadms do |t|

      t.timestamps
    end
  end
end
