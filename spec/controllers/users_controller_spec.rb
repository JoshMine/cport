require 'spec_helper'

describe UsersController do

  describe "registration" do
    it "returns add new user" do
      get 'new'
      response.should be_success
    end
  end

end
