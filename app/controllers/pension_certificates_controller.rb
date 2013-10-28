class PensionCertificatesController < ApplicationController
  before_filter :signed_in_user
  
  layout "participants"
  
  def new
    @participant = current_user.portfolio.participant
    @pension_certificate = PensionCertificate.new
  end
 
  def create
    @participant = current_user.portfolio.participant
    @pension_certificate = @participant.build_pension_certificate(params[:pension_certificate])
    if @pension_certificate.save
      flash[:success] = "Pension Certificate created!!!"
      redirect_to participant_documents_path
    else
      render 'new'
    end
  end

  def edit
    @pension_certificate = PensionCertificate.find(params[:id])
    @participant = @pension_certificate.participant
  end
    
  def update
    @pension_certificate = PensionCertificate.find(params[:id])
    @participant = @pension_certificate.participant
    if @pension_certificate.update_attributes(params[:pension_certificate])
      redirect_to participant_documents_path, notice: 'Pension Certificate was successfully updated.'
    else
      render action: "edit" 
    end 
  end
end
