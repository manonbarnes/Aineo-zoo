class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :animal, foreign_key: true
      t.string :status
      t.integer :duration
      t.date :start_date
      t.time :start_time

      t.timestamps
    end
  end
end
