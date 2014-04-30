class Api::TripsController < ApplicationController
    def index
        @user = User.take
        @trips = @user.trips_users
        #@trips = @user.trips_owned
        render json: @trips, root:"data", meta:{status: 200, msg:"OK"}
        #@trip = Trip.take
        #@user = @trip.owner
        #render json: @user
    end

    def create
        @trip = Trip.new(trip_params)
        @trip.owner_id = current_user.id
        if @trip.save
          render json: {meta:{status: 200, msg:"OK"}}
        else    
          render json: {meta:{status: 404, msg:"create failed"}}
        end
    end

    def show
        render json: @trip = Trip.find(params[:id])
    end

    def update
        @trip = Trip.find(params[:id])
        if @trip.update(trip_params)
          render json: {meta:{status: 200, msg:"OK"}}
        else
          render json: {meta:{status: 404, msg:"Update failed"}}
        end
    end

    def destroy
        @trip = Trip.find(params[:id])
        if @trip.destroy
          render json: {meta:{status: 200, msg:"OK"}}
        else
          render json: {meta:{status: 404, msg:"Delete failed"}}
        end
    end

    private
      def trip_params
          params(:trip).permit(:destination, :start_date, :end_date, :fee)
      end
end
