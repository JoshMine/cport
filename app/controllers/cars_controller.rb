class CarsController < ApplicationController
  before_filter :signed_in_user
  
  layout "participants"
  
  def new
    @participant = current_user.portfolio.participant
    @car = Car.new

  end
 
  def create
    @participant = current_user.portfolio.participant
    @car = @participant.cars.build(params[:car])
    if @car.save
      flash[:success] = "Car created!!!"
      redirect_to participant_property_path
    else
      render 'new'
    end
  end

  def edit
    @car = Car.find(params[:id])
    @participant = @car.participant
  end
    
  def update
    @car = Car.find(params[:id])
    @participant = @car.participant
    if @car.update_attributes(params[:car])
      redirect_to participant_property_path, notice: 'Car was successfully updated.'
    else
      render action: "edit" 
    end 
  end

  def destroy
    @car = Car.find(params[:id])
    @participant = @car.participant
  end
end
