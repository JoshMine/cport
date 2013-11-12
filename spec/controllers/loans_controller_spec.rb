require 'spec_helper'

describe LoansController do

  let(:valid_attributes) { { "user_id" => "1" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all loans as @loans" do
      loan = Loan.create! valid_attributes
      get :index, {}, valid_session
      assigns(:loans).should eq([loan])
    end
  end

  describe "GET show" do
    it "assigns the requested loan as @loan" do
      loan = Loan.create! valid_attributes
      get :show, {:id => loan.to_param}, valid_session
      assigns(:loan).should eq(loan)
    end
  end

  describe "GET new" do
    it "assigns a new loan as @loan" do
      get :new, {}, valid_session
      assigns(:loan).should be_a_new(Loan)
    end
  end

  describe "GET edit" do
    it "assigns the requested loan as @loan" do
      loan = Loan.create! valid_attributes
      get :edit, {:id => loan.to_param}, valid_session
      assigns(:loan).should eq(loan)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Loan" do
        expect {
          post :create, {:loan => valid_attributes}, valid_session
        }.to change(Loan, :count).by(1)
      end

      it "assigns a newly created loan as @loan" do
        post :create, {:loan => valid_attributes}, valid_session
        assigns(:loan).should be_a(Loan)
        assigns(:loan).should be_persisted
      end

      it "redirects to the created loan" do
        post :create, {:loan => valid_attributes}, valid_session
        response.should redirect_to(Loan.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved loan as @loan" do
        # Trigger the behavior that occurs when invalid params are submitted
        Loan.any_instance.stub(:save).and_return(false)
        post :create, {:loan => { "user_id" => "invalid value" }}, valid_session
        assigns(:loan).should be_a_new(Loan)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Loan.any_instance.stub(:save).and_return(false)
        post :create, {:loan => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested loan" do
        loan = Loan.create! valid_attributes

        Loan.any_instance.should_receive(:update_attributes).with({ "user_id" => "1" })
        put :update, {:id => loan.to_param, :loan => { "user_id" => "1" }}, valid_session
      end

      it "assigns the requested loan as @loan" do
        loan = Loan.create! valid_attributes
        put :update, {:id => loan.to_param, :loan => valid_attributes}, valid_session
        assigns(:loan).should eq(loan)
      end

      it "redirects to the loan" do
        loan = Loan.create! valid_attributes
        put :update, {:id => loan.to_param, :loan => valid_attributes}, valid_session
        response.should redirect_to(loan)
      end
    end

    describe "with invalid params" do
      it "assigns the loan as @loan" do
        loan = Loan.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Loan.any_instance.stub(:save).and_return(false)
        put :update, {:id => loan.to_param, :loan => { "user_id" => "invalid value" }}, valid_session
        assigns(:loan).should eq(loan)
      end

      it "re-renders the 'edit' template" do
        loan = Loan.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Loan.any_instance.stub(:save).and_return(false)
        put :update, {:id => loan.to_param, :loan => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested loan" do
      loan = Loan.create! valid_attributes
      expect {
        delete :destroy, {:id => loan.to_param}, valid_session
      }.to change(Loan, :count).by(-1)
    end

    it "redirects to the loans list" do
      loan = Loan.create! valid_attributes
      delete :destroy, {:id => loan.to_param}, valid_session
      response.should redirect_to(loans_url)
    end
  end

end
