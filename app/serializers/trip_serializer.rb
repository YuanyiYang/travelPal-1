class TripSerializer < ActiveModel::Serializer
    attributes :id, :destination, :start_date, :end_date, :fee, :owner_id
    has_one:owner
end
