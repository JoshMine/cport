class TinCertificatesController < ApplicationController
  before_filter :signed_in_user
  
  layout "participants"
  
  def new
    @participant = current_user.portfolio.participant
    @tin_certificate = TinCertificate.new
  end
 
  def create
    @participant = current_user.portfolio.participant
    @tin_certificate = @participant.build_tin_certificate(params[:tin_certificate])
    if @tin_certificate.save
      flash[:success] = "TIN Certificate created!!!"
      redirect_to participant_documents_path
    else
      render 'new'
    end
  end

  def edit
    @tin_certificate = TinCertificate.find(params[:id])
    @participant = @tin_certificate.participant
  end
    
  def update
    @tin_certificate = TinCertificate.find(params[:id])
    @participant = @tin_certificate.participant
    if @tin_certificate.update_attributes(params[:tin_certificate])
      redirect_to participant_documents_path, notice: 'TIN Certificate was successfully updated.'
    else
      render action: "edit" 
    end 
  end
end
