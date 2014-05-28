require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    let(:user_params) {{email: env_email, password: env_password, api_uuid: env_api_uuid}}
    let(:user) { User.new(user_params) }

    it "returns http success" do
      expect_any_instance_of(ApiConnection).to receive(:get_authentication_cookie).with(user).and_return(true)

      post :create, user_params
    end
  end

end
