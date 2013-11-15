class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_access, only: [:edit, :update]

  def dashboard
    @user_presenter = UserPresenter.new(current_user)
  end

  def show
    @user = current_user #User.find(params[:id])
  end

  def edit
    #@user = User.find(params[:id])     # убрано из-за пред фильтра check_access
  end

  def update
    #@user = User.find(params[:id])     # убрано из-за пред фильтра check_access
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  #def destroy
  #  User.find(params[:id]).destroy
  #  flash[:success] = "User destroyed."
  #  redirect_to users_url
  #end
  #
  #private
  #  def signed_in_user
  #    unless user_signed_in?
  #      store_location
  #      redirect_to signin_url, notice: "Please sign in."
  #    end
  #  end
  #
  def check_access
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user.eql?(@user)
  end
end
