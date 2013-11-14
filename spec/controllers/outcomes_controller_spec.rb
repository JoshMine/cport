require 'spec_helper'

describe OutcomesController do
  let(:outcome) { FactoryGirl.create(:outcome) }
  let!(:outcome2) { FactoryGirl.create(:outcome) }
  let!(:valid_attributes) {
    attr = FactoryGirl.build(:outcome).attributes
    attr.delete('id'); attr.delete('created_at'); attr.delete('updated_at'); attr.delete('user_id');
    attr
  }

  before(:each) do
    @user = outcome.user
    sign_in @user
  end

  describe "GET index" do
    it "assigns all outcomes as @outcomes" do
      get :index, {}
      assigns(:outcomes).should eq([outcome])
    end
  end

  describe "GET show" do
    it "assigns the requested outcome as @outcome" do

      get :show, {:id => outcome.to_param}
      assigns(:outcome).should eq(outcome)
    end
  end

  describe "GET new" do
    it "assigns a new outcome as @outcome" do
      get :new, {}
      assigns(:outcome).should be_a_new(Outcome)
    end
  end

  describe "GET edit" do
    it "assigns the requested outcome as @outcome" do

      get :edit, {:id => outcome.to_param}
      assigns(:outcome).should eq(outcome)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Outcome" do
        expect {
          post :create, {:outcome => valid_attributes}
        }.to change(Outcome, :count).by(1)
      end

      it "assigns a newly created outcome as @outcome" do
        post :create, {:outcome => valid_attributes}
        assigns(:outcome).should be_a(Outcome)
        assigns(:outcome).should be_persisted
      end

      it "redirects to the created outcome" do
        post :create, {:outcome => valid_attributes}
        response.should redirect_to(outcomes_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved outcome as @outcome" do
        # Trigger the behavior that occurs when invalid params are submitted
        Outcome.any_instance.stub(:save).and_return(false)
        post :create, {:outcome => {"date_out" => "invalid value"}}
        assigns(:outcome).should be_a_new(Outcome)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Outcome.any_instance.stub(:save).and_return(false)
        post :create, {:outcome => {"date_out" => "invalid value"}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested outcome" do

        # Assuming there are no other outcomes in the database, this
        # specifies that the Outcome created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Outcome.any_instance.should_receive(:update_attributes).with({"date_out" => "2013-11-13"})
        put :update, {:id => outcome.to_param, :outcome => {"date_out" => "2013-11-13"}}
      end

      it "assigns the requested outcome as @outcome" do

        put :update, {:id => outcome.to_param, :outcome => valid_attributes}
        assigns(:outcome).should eq(outcome)
      end

      it "redirects to the outcome" do

        put :update, {:id => outcome.to_param, :outcome => valid_attributes}
        response.should redirect_to(outcomes_url)
      end
    end

    describe "with invalid params" do
      it "assigns the outcome as @outcome" do

        # Trigger the behavior that occurs when invalid params are submitted
        Outcome.any_instance.stub(:save).and_return(false)
        put :update, {:id => outcome.to_param, :outcome => {"date_out" => "invalid value"}}
        assigns(:outcome).should eq(outcome)
      end

      it "re-renders the 'edit' template" do

        # Trigger the behavior that occurs when invalid params are submitted
        Outcome.any_instance.stub(:save).and_return(false)
        put :update, {:id => outcome.to_param, :outcome => {"date_out" => "invalid value"}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested outcome" do

      expect {
        delete :destroy, {:id => outcome.to_param}
      }.to change(Outcome, :count).by(-1)
    end

    it "redirects to the outcomes list" do

      delete :destroy, {:id => outcome.to_param}
      response.should redirect_to(outcomes_url)
    end
  end

end
