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
        cookies[:workshare] = true
      end

      it "returns http success" do
        subject.should be_success
      end
    end
  end

end
