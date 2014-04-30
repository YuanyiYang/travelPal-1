class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email:params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
        sign_in user
        render json: {meta:{status: 200, msg:"OK"}}
    else
        render json: {meta:{status: 404, msg:"login failed"}}
    end
  end

  def destroy
      sign_out
      render json: {meta:{status: 200, msg:"OK"}}
  end
end
