class FlatsController < ApplicationController
  before_filter :signed_in_user
  
  layout "participants"
  
  def new
    @participant = current_user.portfolio.participant
    @flat = Flat.new

  end
 
  def create
    @participant = current_user.portfolio.participant
    @flat = @participant.flats.build(params[:flat])
    if @flat.save
      flash[:success] = "Flat created!!!"
      redirect_to participant_property_path
    else
      render 'new'
    end
  end

  def edit
    @flat = Flat.find(params[:id])
    @participant = @flat.participant
  end
    
  def update
    @flat = Flat.find(params[:id])
    @participant = @flat.participant
    if @flat.update_attributes(params[:flat])
      redirect_to participant_property_path, notice: 'Flat was successfully updated.'
    else
      render action: "edit" 
    end 
  end

  def destroy
    @flat = Flat.find(params[:id])
    @participant = @flat.participant
  end
end
