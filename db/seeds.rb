Perusahaan.create(:nama_penanggung=>"DIRLANTAS",:nama_badan => "DITLANTAS POLDA BALI",:alamat_badan=>"WR SUPRATMAN",:kdperusahaan => "DITLANTAS")
Perusahaan.create(:nama_penanggung=>"KAKOPERASI",:nama_badan => "KOPERASI DITLANTAS POLDA BALI",:alamat_badan=>"WR SUPRATMAN",:kdperusahaan => "KOPLANTAS")
Perusahaan.create(:nama_penanggung=>"TEST DEALER01",:nama_badan => "TEST DEALER 01",:alamat_badan=>"WR SUPRATMAN",:kdperusahaan => "DEALER01")
Perusahaan.create(:nama_penanggung=>"TEST DEALER02",:nama_badan => "TEST DEALER 02",:alamat_badan=>"WR SUPRATMAN",:kdperusahaan => "DEALER02")
Perusahaan.create(:nama_penanggung=>"TEST DEALER03",:nama_badan => "TEST DEALER 03",:alamat_badan=>"WR SUPRATMAN",:kdperusahaan => "DEALER02")
(3..5).each do |t|
  p "User #{t.to_s}"
  User.create!(:email => 'tovianus@gmail.com', :password => 'testing01', :password_confirmation => 'testing01', :perusahaan_id=>1,:roles=>[ 'admin' ]) if t==1
  User.create!(:email => 'sudarsana@gmail.com', :password => '030201064', :password_confirmation => '030201064', :perusahaan_id=>1,:roles=>[ 'admin' ] ) if t==2
  User.create(:email => "testing0#{t}@gmail.com", :password => "testing0#{t}", :password_confirmation => "testing0#{t}", :perusahaan_id=>3,:roles=>[ 'dealer' ]) if t==3
  User.create(:email => "testing0#{t}@gmail.com", :password => "testing0#{t}", :password_confirmation => "testing0#{t}", :perusahaan_id=>4,:roles=>[ 'dealer' ]) if t==4
  (1..10).each do |u|
    u=User.find(t)
    stck=StckRequest.create(merk: "merk test#{u}",jenis:"jenis test#{u}", model: "test#{u}",
      thn_buat: "2013", thn_rakit: "2013", jml_cc: "1000", warna: "test warna #{u}", bbm: "Bensin",
      no_rangka: "#{t} rangka test#{u}", no_mesin: "#{t} mesin test#{u}",:jml_roda=>4,:kabupaten=>"kabupaten test#{u}", :user_id=> t, :perusahaan_id=> u.perusahaan_id) if t>2
    p "STCK ID: #{stck.id}"
  end
end
  

