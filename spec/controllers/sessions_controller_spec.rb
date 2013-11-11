require 'spec_helper'

describe Devise::SessionsController do
  let(:user) { FactoryGirl.create(:user, :confirmed) }
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "should signin user" do

    expect {
      post :create, user: {email: user.email, password: "123456abc!ABC"}
    }.to change {
      user.reload
      user.sign_in_count
    }.by(1)
  end

  it "should not signin user with wrong password" do
    expect {
      post :create, user: {email: user.email, password: "password"}
    }.to_not change { user.sign_in_count }.by(1)
    response.should render_template('devise/sessions/new')
  end

end
