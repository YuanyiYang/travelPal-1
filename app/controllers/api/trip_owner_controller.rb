class Api::TripOwnerController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def update
        user = login_user params[:token]
        if !user.nil?
            if ActiveRecord::Base.connection.execute('UPDATE trips_users SET status="t" WHERE trip_id = ' + params[:trip_id] + ' and user_id =' + params[:id])
                render json: {meta: {status: 200, msg:"OK"}}
            else
                render json: {meta: {status: 404, msg:"application approval failed"}}
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
                render json: {meta: {status: 404, msg:"application decline failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end
end
