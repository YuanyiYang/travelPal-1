class Api::TripParticipantController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def index
        if is_logged_in
            @user = current_user
            @trips = @user.trips_users
            render json: @trips, root:"data", meta:{status: 200, msg:"OK"}
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def update
        if is_logged_in
            @trips_user = TripsUser.new(user_id: current_user.id, trip_id: params[:id], status:false)
            if @trips_user.save
                render json: {meta: {status: 200, msg:"OK"}}
            else
                render json: {meta: {status: 404, msg:"application for trip failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def destroy
        if is_logged_in
            @trips_user = TripsUser.find_by(user_id: current_user.id, trip_id: params[:id])
            render json: @trips_user
            #if @trips_user.destroy
            #    render json: {meta: {status: 200, msg:"OK"}}
            #else
            #    render json: {meta: {status: 404, msg:"quit trip failed"}}
            #end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end
end
