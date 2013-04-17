class CreateStckRequests < ActiveRecord::Migration
  def change
    create_table :stck_requests do |t|
      t.integer :idperusahaan
      t.integer :user_id
      t.integer :perusahaan_id
      t.string :kepentingan
      t.string :merk
      t.string :jenis
      t.string :model
      t.integer :thn_buat
      t.integer :thn_rakit
      t.integer :jml_cc
      t.string :warna
      t.string :bbm
      t.string :tnkb
      t.integer :jml_roda
      t.string :no_rangka
      t.string :no_mesin
      t.datetime :tg_mohon
      t.datetime :tg_persetujuan
      t.string :no_daftar
      t.datetime :tg_daftar
      t.date :tg_akhir
      t.datetime :tg_cetak
      t.datetime :tg_pembatalan
      t.string :kabupaten
      t.integer :idranmor

      t.timestamps
    end
  end
end
