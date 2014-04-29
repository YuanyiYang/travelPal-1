class User < ActiveRecord::Base
    has_many :trips_users
    has_many :trips, through: :trips_users
    has_many :trips_owned, :class_name => "Trip", :foreign_key => "owner_id"
end
