class PortfoliosController < ApplicationController
  before_filter :signed_in_user
  
  def show
    @portfolio = Portfolio.find_by_user_id(current_user.id)
    @participants = @portfolio.participants.all
    #@cdata = ContactData.find_by_person_id(@person.id)
  end
  
  def new
    @portfolio = Portfolio.new
  end
  
  
  def create
    @portfolio = Portfolio.new(params[:portfolio])
    @portfolio.user = current_user
    if @portfolio.save
      flash[:success] = "Portfolio created!!!"
      redirect_to portfolio_addparticipant_path # 'contact_data/new' 'person/new' # signin_path
    else
      render 'new'
    end
  end
  
  def addparticipant
    @portfolio = Portfolio.find_by_user_id(current_user.id)
    @participant = @portfolio.participants.new
    #if @participant.save
    #    flash[:success] = "Participant created!!!"
    #    redirect_to portfolio_path # 'contact_data/new' 'person/new' # signin_path
    #  else
    #    render 'addparticipant'
    #  end
    
  end
  

  
  def destroy
    
  end
end
