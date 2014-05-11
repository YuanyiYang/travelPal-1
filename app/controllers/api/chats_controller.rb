class Api::ChatsController < ApplicationController
    def index
    	user = login_user params[:token]
        if !user.nil? 
        	chats = Trip.find(params[:trip_id]).chats
        	render json: chats, root:"data", meta:{status: 200, msg:"OK"}
    	else
        	render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end

    def create
        user = login_user params[:token]
        if !user.nil? 
          	chat = Chat.new(content: params[:chat][:content], trip_id: params[:trip_id], user_id: user.id)
	        if chat.save
	         	render json: chat, root:"data", meta:{status: 200, msg:"OK"}
	        else    
	            render json: {meta:{status: 404, msg:"create failed"}}
	        end
        else
            render json: {meta:{status: 401, msg:"user not logged in"}}
        end
    end
end
