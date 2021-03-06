class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Hello #{@user.name}. Please Signin!!!"
      redirect_to signin_path
    else
      render 'new'
    end
  end
  
  def edit
    #@user = User.find(params[:id])     # убрано из-за пред фильтра correct_user
  end 
  
  def update
    #@user = User.find(params[:id])     # убрано из-за пред фильтра correct_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
