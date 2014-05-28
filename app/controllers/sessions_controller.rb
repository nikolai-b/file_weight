class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.new (set_user_params)
    cookies[:workshare] = ApiConnection.get_authentication_cookie(user)
  end

  private

  def set_user_params
    user_params = params.require(:user)

    {
      email: user_params[:email],
      password: user_params[:password],
      api_uuid: user_params[:api_uuid]
    }
  end
end
