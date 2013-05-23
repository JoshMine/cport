class PassportsController < ApplicationController
  before_filter :signed_in_user
  
  
  def new
    @passport = Passport.new
  end
 
  def create
    @passport = Passport.new(params[:passport])
  end
   
  def show
    @passport = Passport.find(params[:id])
  end

  def edit
    @passport = Passport.find(params[:id])
  end
    
  def update
    @passport = Passport.find(params[:id])
  end

  def destroy
    @passport = Passport.find(params[:id])
  end
end
