class PassportsController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @passport = Passport.new
  end

  def create
    @passport = Passport.new(params[:participant_passport])
  end

  def edit
    @passport = Passport.find(params[:id])
  end

  def destroy
  end
end
