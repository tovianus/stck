class AddColumnCancelledAtToStckRequest < ActiveRecord::Migration
  def change
    add_column :stck_requests, :tg_batal, :datetime
  end
end
