class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :room_img
      t.integer :price
      t.text :address
      t.integer :user_idr
      t.datetime :start_date
      t.text :description

      t.timestamps
    end
  end
end
