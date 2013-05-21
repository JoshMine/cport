class ContactDataController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @contact_data = ContactData.new
  end
  
  def create
    @contact_data = current_user.portfolio.participant.contact_data.build(params:(@contact_data))
    if @contact_data.save
      redirect_to portfolio_path, notice: 'Contact data was successfully created.'
    else
      render action: "new"
    end
  end

  def destroy
  end
end
