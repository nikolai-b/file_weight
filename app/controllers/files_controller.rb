class FilesController < ApplicationController
  def show
    if cookies[:workshare]
      api_files = ApiConnection.new.get_files(cookies[:workshare])
      @weight_calculator = WeightCalculator.new(api_files.body['files'])
    else
      redirect_to new_session_path
    end
  end
end
