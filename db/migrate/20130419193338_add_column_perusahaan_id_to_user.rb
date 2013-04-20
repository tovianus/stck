class AddColumnPerusahaanIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :perusahaan_id, :integer
  end
end
