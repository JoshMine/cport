class PassportsController < ApplicationController
  before_filter :signed_in_user
  
  layout "participants"
  
  def new
    @participant = current_user.portfolio.participant
    @passport = Passport.new
    #@passport.participant = current_user.portfolio.participants.first
  #  if @passport
  #    redirect_to participant_passport_path
  #  end
  end
 
  def create
    @participant = current_user.portfolio.participant
    @passport = @participant.passports.build(params[:passport])
    #@passport.participant = current_user.portfolio.participant
    if @passport.save
      flash[:success] = "Passport created!!!"
      redirect_to participant_documents_path
    else
      render 'new'
    end
  end
   
  def show
    @passport = Passport.find(params[:id])
    @participant = @passport.participant
  end

  def edit
    @passport = Passport.find(params[:id])
    @participant = @passport.participant
  end
    
  def update
    @passport = Passport.find(params[:id])
    @participant = @passport.participant
    if @passport.update_attributes(params[:passport])
      redirect_to participant_documents_path, notice: 'Passport was successfully updated.'
    else
      render action: "edit" 
    end 
  end

  def destroy
    @passport = Passport.find(params[:id])
    @participant = @passport.participant
  end
end
