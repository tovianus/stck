Perusahaan.create(:nama_perusahaan => "test dealer 01",:kdperusahaan => "tst01")
Perusahaan.create(:nama_perusahaan => "test dealer 02",:kdperusahaan => "tst02")
(1..4).each do |t|
  User.create!(:id=>1,:email => 'tovianus@gmail.com', :password => 'fr33pass', :password_confirmation => 'fr33pass', :perusahaan_id=>1) if t==1
  User.create!(:id=>2,:email => 'sudarsana@gmail.com', :password => '030201064', :password_confirmation => '030201064', :perusahaan_id=>1) if t==2
  User.create(:email => "testing0#{t}@gmail.com", :password => "testing0#{t}", :password_confirmation => "testing0#{t}", :perusahaan_id=>2) if t==3
  User.create(:email => "testing0#{t}@gmail.com", :password => "testing0#{t}", :password_confirmation => "testing0#{t}", :perusahaan_id=>3) if t==4
  UserRole.create(:user_id=>t,:role=>"Administrator") if t<3
  UserRole.create(:user_id=>t,:role=>"Dealer") if t>2
  (1..10).each do |u|
    StckRequest.create(merk: "merk test#{u}",jenis:"jenis test#{u}", model: "test#{u}",
      thn_buat: "2013", thn_rakit: "2013", jml_cc: "1000", warna: "test warna #{u}", bbm: "Bensin",
      no_rangka: "rangka test#{u}", no_mesin: "mesin test#{u}",kabupaten: "kabupaten test#{u}", user_id: t)
  end
end
  

