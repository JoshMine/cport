require 'spec_helper'

describe SessionController do

  it "should reject invalid captcha" do
    setup_controller_for_warden
    request.env["devise.mapping"] = Devise.mappings[:user]

    get :new

    assert_response :success
  end

end