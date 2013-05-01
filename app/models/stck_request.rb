class StckRequest < ActiveRecord::Base
  attr_accessible :bbm, :idperusahaan, :idranmor, :jenis, :jml_cc, :jml_roda, :kabupaten, :kepentingan, :merk, :model, :no_daftar, :no_mesin, :no_rangka, :perusahaan_id, :tg_akhir, :tg_cetak, :tg_daftar, :tg_mohon, :tg_pembatalan, :tg_persetujuan, :thn_buat, :thn_rakit, :tnkb, :user_id, :warna

#
  KABUPATEN=%w[Badung Bangli Buleleng Denpasar Gianyar Jembrana Karangasem Klungkung Tabanan]
  BBM=%w[Premium Solar Premix Gas Listrik]
  TNKB=%w[Hitam Merah Kuning Putih]  

# Relations
  belongs_to :user
  belongs_to :perusahaan

#Before
  before_validation :fill_default
  
#Scope

# By type
  scope :pending, where(:tg_persetujuan => nil)
  scope :approved,  where("tg_persetujuan is not null")
  scope :registered, where("tg_daftar is not null")
  scope :printed, where("tg_cetak is not null")
  scope :cancelled, where("tg_pembatalan is not null")
# By datetime
  scope :fortoday, where(:updated_at => Date.today.beginning_of_day..Date.today.end_of_day)
  scope :forthismonth, where(:updated_at => Date.today.beginning_of_month.beginning_of_day..Date.today.end_of_day)
  scope :forthisyear, where(:updated_at => Date.today.beginning_of_year.beginning_of_day..Date.today.end_of_day)
#Order
  default_scope order("stck_requests.updated_at desc")

  def fill_default
    tg_mohon=DateTime.now if tg_mohon.nil?
    if perusahaan_id.to_s==""
      u=User.find(user_id)
      perusahaan_id=u.perusahaan_id
    end
  end

  def self.byuser(current_user)
    if current_user.roles.to_s.include?"admin"
        self.where("stck_requests.user_id not null")
    else
        self.where("stck_requests.user_id=?",current_user.id)
    end
  end
#Validation
  validates :user_id, :presence => true
  validates :perusahaan_id, :presence => true
  validates :merk, :presence => true
  validates :jenis, :presence => true
  validates :model, :presence => true
  validates :no_rangka, :presence => true, :uniqueness => true
  validates :no_mesin, :presence => true
  validates :thn_buat, :presence => true
  validates :thn_rakit, :presence => true
  validates :jml_cc, :presence => true
  validates :warna, :presence => true
  validates :bbm, :presence => true
#  validates :tnkb, :presence => true
  validates :jml_roda, :presence => true
  validates :tg_mohon, :presence => true
  validates :kabupaten, :presence => true
  
  def stck_status
    status="Dimohon"      if self.tg_persetujuan.nil?
    status="Dibatalkan"   if self.tg_pembatalan!=nil
    status="Disetujui"    if self.tg_persetujuan!=nil
    status="Didaftarkan"  if self.tg_daftar!=nil
    status="Dicetak"      if self.tg_cetak!=nil
    return status
  end

  def self.search(search)
    if search
      if search.upcase.include?"MOHON"
        where('tg_persetujuan is null AND tg_pembatalan is NULL')
      elsif search.upcase.include?"BATAL"
        where('tg_pembatalan is not null')
      elsif search.upcase.include?"SETUJU"
        where('tg_persetujuan is not null')
      elsif search.upcase.include?"DAFTAR"
        where('tg_daftar is not null')
      elsif search.upcase.include?"CETAK"
        where('tg_cetak is not null')
      elsif search.upcase.include?"@"
        #Search by pemohon, Only for admin
        #if current_user.role.is?"ADMIN"
        #  includes(:user).where("users.email LIKE ?",'%#{search}%')
        #end
      else
        where('no_rangka LIKE ? OR no_mesin LIKE ? or merk LIKE ? OR jenis LIKE ? OR model LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      end
    else
      scoped
    end
  end
end
