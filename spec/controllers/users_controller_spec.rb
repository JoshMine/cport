require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user, :confirmed) }

  describe "Dashboard" do
    before do
      sign_in user
    end

    it "should be success" do
      get 'dashboard'
      response.should be_success
    end
  end

end
