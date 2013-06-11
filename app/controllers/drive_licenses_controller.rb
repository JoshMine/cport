class DriveLicensesController < ApplicationController
  
  before_filter :signed_in_user
  
  layout "participants"
  
  def new
    @participant = current_user.portfolio.participant
    @drive_license = DriveLicense.new
  end
 
  def create
    @participant = current_user.portfolio.participant
    @drive_license = @participant.drive_licenses.build(params[:drive_license])
    if @drive_license.save
      flash[:success] = "Drive License created!!!"
      redirect_to participant_documents_path
    else
      render 'new'
    end
  end

  def edit
    @drive_license = DriveLicense.find(params[:id])
    @participant = @drive_license.participant
  end
    
  def update
    @drive_license = DriveLicense.find(params[:id])
    @participant = @drive_license.participant
    if @drive_license.update_attributes(params[:drive_license])
      redirect_to participant_documents_path, notice: 'Drive License was successfully updated.'
    else
      render action: "edit" 
    end 
  end

end


