require 'spec_helper'

describe UsersController do

  describe "Registration pages" do
    it "should return correct response on sign in" do
      get '/signin'
      response.should be_success
    end
    it "should return correct response on sign up" do
      get '/signup'
      response.should be_success
    end
  end

  describe "registration" do
    it "returns add new user" do
      get 'new'
      response.should be_success
    end
  end

  #@request.env["devise.mapping"] = Devise.mappings[:user]
  #get :new

end
