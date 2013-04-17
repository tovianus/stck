class CreatePerusahaans < ActiveRecord::Migration
  def change
    create_table :perusahaans do |t|
      t.string :nama_penanggung
      t.string :nama_badan
      t.string :alamat_badan
      t.string :telepon
      t.string :nama_kontak
      t.string :kdperusahaan

      t.timestamps
    end
  end
end
