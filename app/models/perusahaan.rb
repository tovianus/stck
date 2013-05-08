class Perusahaan < ActiveRecord::Base
  attr_accessible :alamat_badan, :kdperusahaan, :nama_badan, :nama_kontak, :nama_penanggung, :telepon

  has_many :users
  has_many :stck_requests

  validates_presence_of :nama_penanggung, :message => "Nama penanggung harus berisi"
  validates_uniqueness_of :nama_penanggung,:case_sensitive => false, :message => "Nama penanggung sudah ada yang memakai"
  validates_presence_of :nama_badan, :case_sensitive => false, :message => "Nama badan harus diisi"
#  validates_uniqueness_of :nama_badan, :uniqueness => {case_sensitive: false},:message => "Nama badan sudah dipakai"
  validates_uniqueness_of :nama_badan,:message => "Nama badan sudah dipakai"
  validates_presence_of :alamat_badan,:message => "Alamat badan harus diisi"
  validates_presence_of :kdperusahaan,:message => "Kode perusahaan harus diisi"
  validates_uniqueness_of :kdperusahaan,:case_sensitive => false,:message => "Kode perusahaan sudah dipakai"
#  validates_uniqueness_of :kdperusahaan,:uniqueness => {case_sensitive: false},:message => "Kode perusahaan harus diisi"

  def ttl_request
    self.stck_requests.count
  end

  def self.search(search)
    if search
      where("nama_badan LIKE ? OR kdperusahaan LIKE ? OR nama_penanggung LIKE ? OR nama_kontak LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    else
      scoped
    end
  end
end
