class ParticipantsController < ApplicationController
  before_filter :signed_in_user
  
  
  
  # GET /participants/1
  # GET /participants/1.json
  def show
    @participant = Participant.find(params[:id])
  end

  # GET /participants/new
  # GET /participants/new.json
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
    @participant = Participant.find(params[:id])
  end


  def create
    @participant = current_user.portfolio.participants.build(params[:participant])
    if @participant.save
      redirect_to portfolio_path, notice: 'Participant was successfully created.'
    else
      render action: "new"
    end
  end
  
  # PUT /participants/1
  # PUT /participants/1.json
  def update
    @participant = Participant.find(params[:id])

    if @participant.update_attributes(params[:participant])
      redirect_to @participant, notice: 'Participant was successfully updated.'
    else
      render action: "edit" 
    end
  end


  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
    end
  end
end
