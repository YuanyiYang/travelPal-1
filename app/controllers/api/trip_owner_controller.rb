class Api::TripOwnerController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def update
        if is_logged_in
            if TripsUser.update_attributes(status:true)
                render json: {meta: {status: 200, msg:"OK"}}
            else
                render json: {meta: {status: 404, msg:"application approval failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def destroy
        if is_logged_in
            @trips_user = TripsUser.find_by(user_id: params[:id] , trip_id: params[:trip_id])
            if @trips_user.destroy
                render json: {meta: {status: 200, msg:"OK"}}
            else
                render json: {meta: {status: 404, msg:"quit trip failed"}}
            end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

end
