class Api::UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      if @user.save
        render json: {meta:{status: 200, msg:"OK"}}
      else
        render json: {meta:{status: 404, msg:"register failed"}}
      end
    end

    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name, :gender, :age, :college, :major)
      end
end
