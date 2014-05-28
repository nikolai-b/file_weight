class FilesController < ApplicationController
  def show
    redirect_to new_session_path unless cookies[:workshare]
  end
end
