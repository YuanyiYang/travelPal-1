class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.boolean :gender
      t.integer :age
      t.string :college
      t.string :major

      t.timestamps
    end
  end
end
