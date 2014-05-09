class Trip < ActiveRecord::Base
    has_many :trips_users, dependent: :destroy
    has_many :users, through: :trips_users
    has_many :chats, dependent: :destroy
    belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
end
