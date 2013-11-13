require 'spec_helper'

describe LoansController do
  let(:loan) { FactoryGirl.create(:loan) }
  let!(:loan2) { FactoryGirl.create(:loan) }
  let!(:valid_attributes) {
    attr = FactoryGirl.build(:loan).attributes
    attr.delete('id'); attr.delete('created_at'); attr.delete('updated_at')
    attr
  }

  before(:each) do
    @user = loan.user
    sign_in @user
  end

  describe "GET index" do
    it "assigns all loans as @loans" do
      get :index
      assigns(:loans).map(&:id).should eq(@user.loan_ids)
    end
  end

  describe "GET show" do
    it "assigns the requested loan as @loan" do
      get :show, {:id => loan.to_param}
      assigns(:loan).should eq(loan)
    end
  end


  describe "GET new" do
    it "assigns a new loan as @loan" do
      get :new
      assigns(:loan).should be_a_new(Loan)
    end
  end

  describe "GET edit" do
    it "assigns the requested loan as @loan" do
      get :edit, {:id => loan.to_param}
      assigns(:loan).should eq(loan)
    end
  end


  describe "POST create" do
    describe "with valid params" do
      it "creates a new Loan" do
        expect {
          post :create, {:loan => valid_attributes}
        }.to change(Loan, :count).by(1)
      end

      it "assigns a newly created loan as @loan" do
        post :create, {:loan => valid_attributes}
        assigns(:loan).should be_a(Loan)
        assigns(:loan).should be_persisted
      end

      it "redirects to the created loan" do
        post :create, {:loan => valid_attributes}
        response.should redirect_to(loans_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved loan as @loan" do
        # Trigger the behavior that occurs when invalid params are submitted
        Loan.any_instance.stub(:save).and_return(false)
        post :create, {:loan => {"user_id" => "invalid value"}}
        assigns(:loan).should be_a_new(Loan)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Loan.any_instance.stub(:save).and_return(false)
        post :create, {:loan => {"user_id" => "invalid value"}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested loan" do

        Loan.any_instance.should_receive(:update_attributes).with({"user_id" => "1"})
        put :update, {:id => loan.to_param, :loan => {"user_id" => "1"}}
      end

      it "assigns the requested loan as @loan" do
        put :update, {:id => loan.to_param, :loan => valid_attributes}
        assigns(:loan).should eq(loan)
      end

      it "redirects to the loan" do
        put :update, {:id => loan.to_param, :loan => valid_attributes}
        response.should redirect_to(loans_path)
      end
    end

      describe "with invalid params" do
        it "assigns the loan as @loan" do
          # Trigger the behavior that occurs when invalid params are submitted
          Loan.any_instance.stub(:save).and_return(false)
          put :update, {:id => loan.to_param, :loan => { "user_id" => "invalid value" }}
          assigns(:loan).should eq(loan)
        end

        it "re-renders the 'edit' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Loan.any_instance.stub(:save).and_return(false)
          put :update, {:id => loan.to_param, :loan => { "user_id" => "invalid value" }}
          response.should render_template("edit")
        end
      end
  end


  describe "DELETE destroy" do
    it "destroys the requested loan" do

      expect {
        delete :destroy, {:id => loan.to_param}
      }.to change(Loan, :count).by(-1)
    end

    it "redirects to the loans list" do

      delete :destroy, {:id => loan.to_param}
      response.should redirect_to(loans_url)
    end
  end

end
