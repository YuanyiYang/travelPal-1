class TripsController < ApplicationController
    def index
        #@user = User.take
        #@trips = @user.trips_users
        #@trips = @user.trips_owned
        #render json: @trips, root:"data", meta:{status: 200, msg:"OK"}
        @trip = Trip.take
        @user = @trip.owner
        render json: @user
    end
end
