class LoansController < ApplicationController

  before_filter :authenticate_user!
  before_filter :set_loan, only: [:destroy, :show, :edit, :update]
  respond_to :js, :html, :json

  # GET /loans
  # GET /loans.json
  def index
    @loans = current_user.loans.page(params[:page]).decorate

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loans }
    end
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @loan.decorate }
    end
  end

  # GET /loans/new
  # GET /loans/new.json
  def new
    @loan = Loan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loan }
      format.js
    end
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(params[:loan])
    @loan.user = current_user
    @loan = @loan.decorate

    respond_to do |format|
      if @loan.save
        format.html { redirect_to loans_path, notice: t(:flash_created, scope: 'controllers.loans') }
        format.json { render json: @loan, status: :created, location: @loan }
      else
        format.html { render action: "new" }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loans/1
  # PUT /loans/1.json
  def update

    respond_to do |format|
      if @loan.update_attributes(params[:loan])
        format.html { redirect_to loans_path, notice: t(:flash_updated, scope: 'controllers.loans') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy

    respond_to do |format|
      format.html { redirect_to loans_url }
      format.json { head :no_content }
    end
  end

  private

  def set_loan
    @loan = current_user.loans.where(id: params[:id]).first
  end
end
