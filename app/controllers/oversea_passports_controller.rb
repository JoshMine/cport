class OverseaPassportsController < ApplicationController
  before_filter :signed_in_user
  
  layout "participants"
  
  def new
    @participant = current_user.portfolio.participant
    @oversea_passport = OverseaPassport.new

  end
 
  def create
    @participant = current_user.portfolio.participant
    @oversea_passport = @participant.oversea_passports.build(params[:oversea_passport])
    if @oversea_passport.save
      flash[:success] = "Oversea Passport created!!!"
      redirect_to participant_documents_path
    else
      render 'new'
    end
  end

  def edit
    @oversea_passport = OverseaPassport.find(params[:id])
    @participant = @oversea_passport.participant
  end
    
  def update
    @oversea_passport = OverseaPassport.find(params[:id])
    @participant = @oversea_passport.participant
    if @oversea_passport.update_attributes(params[:oversea_passport])
      redirect_to participant_documents_path, notice: 'Oversea Passport was successfully updated.'
    else
      render action: "edit" 
    end 
  end

  def destroy
    @oversea_passport = OverseaPassport.find(params[:id])
    @participant = @oversea_passport.participant
  end
end
