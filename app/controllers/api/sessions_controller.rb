class Api::SessionsController < ApplicationController
  def create
  end

  private
    def login_params
      params.require(:user).permit(:email, :password)
    end
end
