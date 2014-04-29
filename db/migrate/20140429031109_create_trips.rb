class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.datetime :start_date
      t.datetime :end_date
      t.integer :fee
      t.belongs_to :owner

      t.timestamps
    end
  end
end
