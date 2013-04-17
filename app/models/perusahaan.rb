class Perusahaan < ActiveRecord::Base
  attr_accessible :alamat_badan, :kdperusahaan, :nama_badan, :nama_kontak, :nama_penanggung, :telepon
end
