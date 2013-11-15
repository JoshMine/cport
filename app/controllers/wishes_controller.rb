class WishesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :set_wish, only: [:destroy, :show, :edit, :update]
  respond_to :html, :json


  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = current_user.wishes.page(params[:page]).decorate

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishes }
    end
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @wish }
    end
  end

  # GET /wishes/new
  # GET /wishes/new.json
  def new
    @wish = Wish.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @wish }
    end
  end

  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes
  # POST /wishes.json
  def create
    @wish = Wish.new(params[:wish])
    @wish.user = current_user
    @wish = @wish.decorate

    respond_to do |format|
      if @wish.save
        format.html { redirect_to wishes_path, notice: t(:flash_created, scope: 'controllers.wishes') }
        format.json { render json: @wish, status: :created, location: @wish }
        format.js {  }
      else
        format.html { render action: "new" }
        format.js { render action: "new" }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wishes/1
  # PUT /wishes/1.json
  def update

    respond_to do |format|
      if @wish.update_attributes(params[:wish])
        format.html { redirect_to wishes_path, notice: t(:flash_updated, scope: 'controllers.wishes') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to wishes_url }
      format.json { head :no_content }
    end
  end

  private

  def set_wish
    @wish = current_user.wishes.where(id: params[:id]).first
  end
end
