class MainJobsController < ApplicationController
  before_filter :authenticate_user!
  
  layout "participants"
  
  def new
    @participant = current_user.portfolio.participant
    @main_job = MainJob.new

  end
 
  def create
    @participant = current_user.portfolio.participant
    @main_job = @participant.main_jobs.build(params[:main_job])
    if @main_job.save
      flash[:success] = "Main job created!!!"
      redirect_to participant_incoming_path
    else
      render 'new'
    end
  end

  def edit
    @main_job = MainJob.find(params[:id])
    @participant = @main_job.participant
  end
    
  def update
    @main_job = MainJob.find(params[:id])
    @participant = @main_job.participant
    if @main_job.update_attributes(params[:main_job])
      redirect_to participant_incoming_path, notice: 'Main job was successfully updated.'
    else
      render action: "edit" 
    end 
  end

  def destroy
    @main_job = MainJob.find(params[:id])
    @participant = @main_job.participant
  end
end
