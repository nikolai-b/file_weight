require 'spec_helper'

describe ApiConnection do
  subject { ApiConnection.new }

  describe '#get_authentication_cookie' do
    context "with correct credintials" do

      let(:user_params) {{email: env_email, password: env_password, api_uuid: env_api_uuid}}
      let(:user) { User.new(user_params) }

      it "returns an authentication string" do
        cookie = subject.get_authentication_cookie(user)
        expect(cookie).to include("device_credentials")
        expect(cookie).to include("my_session_id")
      end
    end

    context "with incorrect credintials" do
      let(:user_params) {{email: "test@test.com", password: "password", api_uuid: "api_uuid"}}
      let(:user) { User.new(user_params) }

      it "returns nil" do
        cookie = subject.get_authentication_cookie(user)
        expect(cookie).to be_nil
      end
    end
  end

  describe '#get_files' do
    context "with correct cookie" do
      let(:user_params) {{email: env_email, password: env_password, api_uuid: env_api_uuid}}
      let(:user) { User.new(user_params) }
      let(:cookie) {subject.get_authentication_cookie(user)}

      it "should have status ok and files in the body" do
        response = subject.get_files(cookie)

        expect(response.status).to eq(200)
        expect(response.body["files"]).to_not be_nil
      end
    end

    context "with incorrect cookie" do
      let(:cookie) { "not real" }

      it "should have status forbidden" do
        response = subject.get_files(cookie)

        expect(response.status).to eq(401)
      end
    end
  end
end
