class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable,
         :timeoutable
# :validatable,:registerable,
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :perusahaan_id
  # attr_accessible :title, :body

  has_many :stck_requests
  belongs_to :perusahaan

  ROLES = %w[admin approving registering printing dealer banned]

  validates_presence_of :email, :message => "Email harus diisi"
  validates_uniqueness_of :email, :message => "Email sudah terdaftar"
  validates_presence_of :perusahaan_id, :message => "Perusahaan harus diisi"
  validates_presence_of :roles, :message => "Pilih hak sebagai petugas atau sebagai dealer"
#  validate  roles_as_dealer
#  validates :roles, :if => { :include => "dealer", :length { :is => 1 }, :message => "Pilih antara hak dealer ATAU hak sebagai petugas Kepolisian" }


  def roles_as_dealer
#DEALER
    if roles.to_s=="" # Empty roles
      self.errors.add(:roles, "Pilih antara hak dealer ATAU hak sebagai petugas Kepolisian")
    end
    if roles.include?"dealer" and roles.size!=1
      self.errors.add(:roles, "Pilih antara hak dealer ATAU hak sebagai petugas Kepolisian")
    end
#THE REST
#      if roles      
#      errors.add "bila diberikan hak DEALER maka tidak diperbolehkan memiliki hak sebagai petugas Kepolisian"
#    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def self.byperusahaan(search)
     includes(:perusahaan).where("perusahaans.nama_badan LIKE ? OR perusahaans.kdperusahaan LIKE ?","%#{search}%","%#{search}%")
  end

  def self.search(search)
    if search
      includes(:perusahaan).where("perusahaans.nama_badan LIKE ? OR perusahaans.kdperusahaan LIKE ? OR email LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
    else
      scoped
    end
  end

end
