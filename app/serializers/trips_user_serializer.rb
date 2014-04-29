class TripsUserSerializer < ActiveModel::Serializer
  attributes :user_id, :trip_id, :status
  has_one:trip
end
