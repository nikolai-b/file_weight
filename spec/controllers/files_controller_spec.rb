require 'spec_helper'

describe FilesController do

  describe "GET 'show'" do
    subject { get 'show' }

    context "without cookie" do
      it "redirects" do
        subject.should redirect_to "/sessions/new"
      end
    end

    context "with cookie" do
      before do
        cookies[:workshare] = "fake cookie"

        api_files = double(:api_files)
        api_files.stub(:body).and_return({'files' => true} )
        ApiConnection.any_instance.stub(:get_files).and_return(api_files)
      end

      it "returns http success" do
        subject.should be_success
      end
    end
  end

end
