class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :departure_id
      t.integer :arrival_id
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
