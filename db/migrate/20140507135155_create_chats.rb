class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :content
      t.references :trip, index: true
      t.references :user

      t.timestamps
    end
  end
end
