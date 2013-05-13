require 'spec_helper'

describe PersonsController do

  describe "GET 'person'" do
    it "returns http success" do
      get 'person'
      response.should be_success
    end
  end

  describe "GET 'contact_data'" do
    it "returns http success" do
      get 'contact_data'
      response.should be_success
    end
  end

end
