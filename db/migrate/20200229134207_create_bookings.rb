class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true
    end
  end
end
