class CreatePesans < ActiveRecord::Migration[6.0]
  def change
    create_table :pesans do |t|
      t.string :pesan_nama_pengirim
      t.string :pesan_telepon_pengirim
      t.string :pesan_email_pengirim
      t.string :pesan_subjek
      t.string :pesan_isi

      t.timestamps
    end
  end
end
