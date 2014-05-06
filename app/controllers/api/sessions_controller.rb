class Api::SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        remember_token = User.new_remember_token
        user.update_attribute(:remember_token, remember_token)
        render json: {meta:{status: 200, msg:"OK"}, data:{token: remember_token}}
    else
        render json: {meta:{status: 404, msg:"login failed"}}
    end
  end

  def destroy
    user = login_user params[:token]
    if !user.nil?
      remember_token = User.new_remember_token
      user.update_attribute(:remember_token, remember_token)
      render json: {meta:{status: 200, msg:"OK"}}
    else
      render json: {meta:{status: 401, msg:"user not logged in"}}
    end
  end
end
