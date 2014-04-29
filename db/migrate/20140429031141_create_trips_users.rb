class CreateTripsUsers < ActiveRecord::Migration
  def change
    create_table :trips_users, :id => false do |t|
      t.references :user
      t.references :trip
      t.boolean :status

      t.timestamps
    end

    add_index :trips_users, [:user_id, :trip_id], :unique => true
  end
end
