class IncomesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :set_income, only: [:destroy, :show, :edit, :update]
  respond_to :html, :json


  # GET /incomes
  # GET /incomes.json
  def index
    @incomes = current_user.incomes.page(params[:page]).decorate

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incomes }
    end
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    respond_to do |format|
#      format.html # show.html.erb
      format.json { render json: @income }
    end
  end

  # GET /incomes/new
  # GET /incomes/new.json
  def new
    @income = Income.new

    respond_with(@income) do |format|
      format.html # new.html.erb
      format.js {}
      format.json { render json: @income }
    end
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(params[:income])
    @income.user = current_user
    @income = @income.decorate

    respond_to do |format|
      if @income.save
        format.html { redirect_to incomes_path, notice: t(:flash_created, scope: 'controllers.incomes') }
        format.json { render json: @income, status: :created, location: @income }
        format.js {}
      else
        format.html { render action: "new" }
        format.js { render action: "new" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incomes/1
  # PUT /incomes/1.json
  def update

    respond_to do |format|
      if @income.update_attributes(params[:income])
        format.html { redirect_to incomes_path, notice: t(:flash_updated, scope: 'controllers.incomes') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.json { head :no_content }
    end
  end

  private

  def set_income
    @income = current_user.incomes.where(id: params[:id]).first
  end
end
