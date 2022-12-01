class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :time_from
      t.date :time_to
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
