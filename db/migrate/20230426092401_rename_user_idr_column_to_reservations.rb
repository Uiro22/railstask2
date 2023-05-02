class RenameUserIdrColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :user_idr, :user_id
  end
end
