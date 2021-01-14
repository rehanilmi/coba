class CreateContactus < ActiveRecord::Migration[6.0]
  def change
    create_table :contactus do |t|
      t.string :cu_nama
      t.string :cu_telepon
      t.string :cu_email
      t.string :cu_subjek
      t.string :cu_pesan

      t.timestamps
    end
  end
end
