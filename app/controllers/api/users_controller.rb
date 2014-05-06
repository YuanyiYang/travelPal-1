class Api::UsersController < ApplicationController
    def index
    end

    def create
      user = User.new(user_params)
      remember_token = User.new_remember_token
      user.remember_token = remember_token
      if user.save
        render json: {meta:{status: 200, msg:"OK"}, data:{token: remember_token}}
      else
        render json: {meta:{status: 404, msg:"register failed"}}
      end
    end

    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name, :gender, :age, :college, :major)
      end
end
