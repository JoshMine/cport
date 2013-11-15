require 'spec_helper'

describe IncomesController do
  let(:income) { FactoryGirl.create(:income) }
  let!(:income2) { FactoryGirl.create(:income) }
  let!(:valid_attributes) {
    attr = FactoryGirl.build(:income).attributes
    attr.delete('id'); attr.delete('created_at'); attr.delete('updated_at'); attr.delete('user_id');
    attr
  }

  before(:each) do
    @user = income.user
    sign_in @user
  end

  describe "GET index" do
    it "assigns all incomes as @incomes" do
      get :index, {}
      assigns(:incomes).should eq([income])
      assigns(:incomes).should be_decorated
    end
  end

  describe "GET show" do
    it "assigns the requested income as @income" do

      get :show, {:id => income.to_param}
      assigns(:income).should eq(income)
    end
  end

  describe "GET new" do
    it "assigns a new income as @income" do
      get :new, {}
      assigns(:income).should be_a_new(Income)
    end
  end

  describe "GET edit" do
    it "assigns the requested income as @income" do

      get :edit, {:id => income.to_param}
      assigns(:income).should eq(income)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Income" do
        expect {
          post :create, {:income => valid_attributes}
        }.to change(Income, :count).by(1)
      end

      it "assigns a newly created income as @income" do
        post :create, {:income => valid_attributes}
        assigns(:income).should be_a(Income)
        assigns(:income).should be_persisted
      end

      it "redirects to the created income" do
        post :create, {:income => valid_attributes}
        response.should redirect_to(incomes_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved income as @income" do
        # Trigger the behavior that occurs when invalid params are submitted
        Income.any_instance.stub(:save).and_return(false)
        post :create, {:income => {"date_in" => "invalid value"}}
        assigns(:income).should be_a_new(Income)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Income.any_instance.stub(:save).and_return(false)
        post :create, {:income => {"date_in" => "invalid value"}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested income" do

        # Assuming there are no other incomes in the database, this
        # specifies that the Income created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Income.any_instance.should_receive(:update_attributes).with({"date_in" => "2013-11-13"})
        put :update, {:id => income.to_param, :income => {"date_in" => "2013-11-13"}}
      end

      it "assigns the requested income as @income" do

        put :update, {:id => income.to_param, :income => valid_attributes}
        assigns(:income).should eq(income)
      end

      it "redirects to the income" do

        put :update, {:id => income.to_param, :income => valid_attributes}
        response.should redirect_to(incomes_url)
      end
    end

    describe "with invalid params" do
      it "assigns the income as @income" do

        # Trigger the behavior that occurs when invalid params are submitted
        Income.any_instance.stub(:save).and_return(false)
        put :update, {:id => income.to_param, :income => {"date_in" => "invalid value"}}
        assigns(:income).should eq(income)
      end

      it "re-renders the 'edit' template" do

        # Trigger the behavior that occurs when invalid params are submitted
        Income.any_instance.stub(:save).and_return(false)
        put :update, {:id => income.to_param, :income => {"date_in" => "invalid value"}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested income" do

      expect {
        delete :destroy, {:id => income.to_param}
      }.to change(Income, :count).by(-1)
    end

    it "redirects to the incomes list" do

      delete :destroy, {:id => income.to_param}
      response.should redirect_to(incomes_url)
    end
  end

end
