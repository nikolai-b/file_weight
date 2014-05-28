require "spec_helper"

describe FilesController do
  describe "routing" do

    it "routes to #show" do
      get("/files/show").should route_to("files#show")
    end

  end
end

