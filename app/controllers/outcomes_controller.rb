class OutcomesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :set_outcome, only: [:destroy, :show, :edit, :update]
  respond_to :html, :json


  # GET /outcomes
  # GET /outcomes.json
  def index
    @outcomes = current_user.outcomes.page(params[:page]).decorate

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outcomes }
    end
  end

  # GET /outcomes/1
  # GET /outcomes/1.json
  def show
    respond_to do |format|
#      format.html # show.html.erb
      format.json { render json: @outcome }
    end
  end

  # GET /outcomes/new
  # GET /outcomes/new.json
  def new
    @outcome = Outcome.new

    respond_with(@outcome) do |format|
      format.html # new.html.erb
      format.js { }
      format.json { render json: @outcome }
    end
  end

  # GET /outcomes/1/edit
  def edit
  end

  # POST /outcomes
  # POST /outcomes.json
  def create
    @outcome = Outcome.new(params[:outcome])
    @outcome.user = current_user
    @outcome = @outcome.decorate

    respond_to do |format|
      if @outcome.save
        format.html { redirect_to outcomes_path, notice: t(:flash_created, scope: 'controllers.outcomes') }
        format.json { render json: @outcome, status: :created, location: @outcome }
        format.js { }
      else
        format.html { render action: "new" }
        format.js { render action: "new" }
        format.json { render json: @outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outcomes/1
  # PUT /outcomes/1.json
  def update

    respond_to do |format|
      if @outcome.update_attributes(params[:outcome])
        format.html { redirect_to outcomes_path, notice: t(:flash_updated, scope: 'controllers.outcomes') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outcomes/1
  # DELETE /outcomes/1.json
  def destroy
    @outcome.destroy

    respond_to do |format|
      format.html { redirect_to outcomes_url }
      format.json { head :no_content }
    end
  end

  private

  def set_outcome
    @outcome = current_user.outcomes.where(id: params[:id]).first
  end
end
