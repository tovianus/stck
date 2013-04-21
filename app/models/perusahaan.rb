class Perusahaan < ActiveRecord::Base
  attr_accessible :alamat_badan, :kdperusahaan, :nama_badan, :nama_kontak, :nama_penanggung, :telepon

  has_many :users
  has_many :stck_requests

  validates :nama_penanggung, :presence => true
  validates :nama_badan, :presence => true, :uniqueness => true
  validates :alamat_badan, :presence => true
  validates :kdperusahaan, :presence => true, :uniqueness => true

  def ttl_request
    self.stck_requests.count
  end

end
