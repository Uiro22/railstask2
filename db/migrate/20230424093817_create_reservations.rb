class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price
      t.integer :number
      t.integer :room_id
      t.integer :user_idr

      t.timestamps
    end
  end
end
