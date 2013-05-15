class PortfoliosController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @portfolio = Portfolio.new
  end
  
  
  def create
    @portfolio = Portfolio.new(params[:portfolio])
    if @portfolio.save
      flash[:success] = "Portfolio created!!!"
      redirect_to portfolios_path# 'contact_data/new' 'person/new' # signin_path
    else
      render 'new'
    end
  end
  
  
  def destroy
    
  end
end
