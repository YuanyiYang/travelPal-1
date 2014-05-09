class Api::TripsController < ApplicationController
    def index
        user = login_user params[:token]
        if !user.nil?
          if !user.trips.empty?
            trips = Trip.where('id not in (?)', user.trips.ids)
          end
          trips = trips.last(10)
          render json: trips, root:"data", meta:{status: 200, msg:"OK"}
        else
          render json: {meta:{status: 401, msg:"user not logged in"}}
        end
          #@trips = @user.trips_owned
          #@user = @trip.owner
    end

    def create
        user = login_user params[:token]
        if !user.nil?
            trip = Trip.new(trip_params)
            trip.owner_id = user.id
            if trip.save
                TripsUser.create(user_id: trip.owner_id, trip_id: trip.id, status:true)  
                render json: {meta:{status: 200, msg:"OK"}}
            else    
                render json: {meta:{status: 404, msg:"create failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end        
    end

    def show
        user = login_user params[:token]
        if !user.nil?
            render json: Trip.find(params[:id]), root:"data", meta:{status: 200, msg:"OK"}
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def update
        user = login_user params[:token]
        if !user.nil?
            trip = Trip.find(params[:id])
            if trip.update_attributes(trip_params)
                render json: {meta:{status: 200, msg:"OK"}}
            else
                render json: {meta:{status: 404, msg:"Update failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def destroy
        user = login_user params[:token]
        if !user.nil?
            trip = Trip.find(params[:id])
            if trip.destroy
                render json: {meta:{status: 200, msg:"OK"}}
            else
                render json: {meta:{status: 404, msg:"Delete failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def search
        user = login_user params[:token]
        if !user.nil?
          trips = Trip.where('id not in (?)', user.trips.ids).where(trip_keywords)
          render json: trips, root:"data", meta:{status: 200, msg:"OK"}
        else
          render json: {meta:{status: 401, msg:"user not logged in"}}
        end
          #@trips = @user.trips_owned
          #@user = @trip.owner
    end

    private
      def trip_params
        params.require(:trip).permit(:destination, :start_date, :end_date, :fee)
      end

      def trip_keywords
        params.require(:keywords).permit(:destination, :start_date, :end_date, :fee)
      end
end
