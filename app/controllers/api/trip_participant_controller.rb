class Api::TripParticipantController < ApplicationController
    def index
        user = login_user params[:token]
        if !user.nil?
            trips = user.trips
            render json: trips, root:"data", meta:{status: 200, msg:"OK"}
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def update
        user = login_user params[:token]
        if !user.nil?
            trips_user = TripsUser.new(user_id: user.id, trip_id: params[:id], status:false)
            if trips_user.save
                render json: {meta: {status: 200, msg:"OK"}}
            else
                render json: {meta: {status: 404, msg:"application for trip failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def destroy
        user = login_user params[:token]
        if !user.nil?
            if TripsUser.delete_all(["user_id = ? AND trip_id = ?", user.id, params[:id]])
               render json: {meta: {status: 200, msg:"OK"}}
            else
               render json: {meta: {status: 404, msg:"quit trip failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end
end
