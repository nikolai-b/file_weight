class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.new (set_user_params)
    cookies[:workshare] = ApiConnection.new.get_authentication_cookie(user)
    redirect_to files_show_path
  end

  def destroy
    cookies.delete :workshare
    redirect_to new_sessions_path
  end

  private

  def set_user_params
    {
      email: params[:email],
      password: params[:password],
      api_uuid: params[:api_uuid]
    }
  end
end
