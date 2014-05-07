class TripSerializer < ActiveModel::Serializer
	def participants
		object.trips_users
	end

    attributes :id, :destination, :start_date, :end_date, :fee
    has_one :owner
    has_many :participants
    has_many :chats
end
