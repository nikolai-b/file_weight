class FilesController < ApplicationController
  def show
    redirect_to sessions_new_path unless cookies[:workshare]
  end
end
