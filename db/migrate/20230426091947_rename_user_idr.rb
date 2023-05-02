class RenameUserIdr < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :user_idr, :user_id
  end
end
