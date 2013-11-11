require 'spec_helper'

describe Devise::RegistrationsController do
  let(:valid_params) { {"user" => {"name" => "Test4", "email" => "test4@gg.com",
                                   "password" => "password", "password_confirmation" => "password"}} }
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "should create new user" do
    expect {
      post :create, valid_params
    }.to change { User.count }.by(1)
  end

  it "should not create new user with blank email" do
    valid_params['user']['email'] = ''
    expect {
      post :create, valid_params
    }.to_not change { User.count }.by(1)
  end

  it "should not create new user with blank name" do
    valid_params['user']['name'] = ''
    expect {
      post :create, valid_params
    }.to_not change { User.count }.by(1)
  end

  it "should not create new user with different password confirmation" do
    valid_params['user']['password_confirmation'] = 'different'
    expect {
      post :create, valid_params
    }.to_not change { User.count }.by(1)
  end


  it "should show signup page" do
    get :new
    assert_response :success
  end

end