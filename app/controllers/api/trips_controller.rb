class Api::TripsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def index
        @user = current_user
        @trips = @user.trips_users
        render json: @trips, root:"data", meta:{status: 200, msg:"OK"}
        #@trips = @user.trips_owned
        #@user = @trip.owner
    end

    def create
        @trip = Trip.new(trip_params)
        @trip.owner_id = current_user.id
        if @trip.save
          TripsUser.create(user_id: @trip.owner_id, trip_id: @trip.id, status:true)  
          render json: {meta:{status: 200, msg:"OK"}}
        else    
          render json: {meta:{status: 404, msg:"create failed"}}
        end
    end

    def show
        render json: Trip.find(params[:id]), root:"data", meta:{status: 200, msg:"OK"}
    end

    def update
        @trip = Trip.find(params[:id])
        if @trip.update_attributes(trip_params)
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
        params.require(:trip).permit(:destination, :start_date, :end_date, :fee)
      end
end
