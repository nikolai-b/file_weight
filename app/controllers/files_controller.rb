class FilesController < ApplicationController
  def show
    if cookies[:workshare]
      ApiConnection.new.get_files(cookies[:workshare])
    else
      redirect_to new_session_path
    end
  end
end
