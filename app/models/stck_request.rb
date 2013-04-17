class StckRequest < ActiveRecord::Base
  attr_accessible :bbm, :idperusahaan, :idranmor, :jenis, :jml_cc, :jml_roda, :kabupaten, :kepentingan, :merk, :model, :no_daftar, :no_mesin, :no_rangka, :perusahaan_id, :tg_akhir, :tg_cetak, :tg_daftar, :tg_mohon, :tg_pembatalan, :tg_persetujuan, :thn_buat, :thn_rakit, :tnkb, :user_id, :warna
end
