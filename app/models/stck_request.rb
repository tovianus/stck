class StckRequest < ActiveRecord::Base
  attr_accessible :bbm, :idperusahaan, :idranmor, :jenis, :jml_cc, :jml_roda, :kabupaten, :kepentingan, :merk, :model, :no_daftar, :no_mesin, :no_rangka, :perusahaan_id, :tg_akhir, :tg_cetak, :tg_daftar, :tg_mohon, :tg_pembatalan, :tg_persetujuan, :thn_buat, :thn_rakit, :tnkb, :user_id, :warna

#
  KABUPATEN=%w[Badung Bangli Buleleng Denpasar Gianyar Jembrana Karangasem Klungkung Tabanan]
  BBM=%w[Premium Solar Premix Gas Listrik]
  TNKB=%w[Hitam Merah Kuning Putih]  

# Relations
  belongs_to :user
  belongs_to :perusahaan
  
#Scope

# By type
  scope :pending, where(:tg_persetujuan => nil)
  scope :approved,  where("tg_persetujuan is not null")
  scope :registered, where("tg_daftar is not null")
  scope :printed, where("tg_cetak is not null")
  scope :cancelled, where("tg_batal is not null")
# By datetime
  scope :fortoday, where(:updated_at => Date.today.beginning_of_day..Date.today.end_of_day)
  scope :forthismonth, where(:updated_at => Date.today.beginning_of_month.beginning_of_day..Date.today.end_of_day)
  scope :forthisyear, where(:updated_at => Date.today.beginning_of_year.beginning_of_day..Date.today.end_of_day)
#Order
  default_scope order("updated_at desc")

  def self.byuser(current_user)
    if current_user.roles.to_s.include?"admin"
        self.where("user_id not null")
    else
        self.where("user_id=?",current_user.id)
    end
  end
#Validation
  validates :user_id, :presence => true
  validates :perusahaan_id, :presence => true
  validates :merk, :presence => true
  validates :model, :presence => true
  validates :no_rangka, :presence => true, :uniqueness => true
  validates :no_mesin, :presence => true
  validates :thn_buat, :presence => true
  validates :thn_rakit, :presence => true
  validates :jml_cc, :presence => true
  validates :warna, :presence => true
  validates :bbm, :presence => true
  validates :tnkb, :presence => true
  validates :jml_roda, :presence => true
  validates :tg_mohon, :presence => true
  validates :kabupaten, :presence => true
  

end
