require 'spec_helper'

describe WishesController do
  let(:wish) { FactoryGirl.create(:wish) }
  let!(:wish2) { FactoryGirl.create(:wish) }
  let!(:valid_attributes) {
    attr = FactoryGirl.build(:wish).attributes
    attr.delete('id'); attr.delete('created_at'); attr.delete('updated_at'); attr.delete('user_id');
    attr
  }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in wish.user
  end

  describe "GET index" do
    it "assigns all wishes as @wishes" do
      get :index, {}
      assigns(:wishes).should eq([wish])
      assigns(:wishes).should be_decorated
    end
  end

  describe "GET show" do
    it "assigns the requested wish as @wish" do
      get :show, {id: wish.to_param, format: :json}
      response.should be_success
      assigns(:wish).should eq(wish)
    end
  end

  describe "GET new" do
    it "assigns a new wish as @wish" do
      get :new, {}
      assigns(:wish).should be_a_new(Wish)
    end
  end

  describe "GET edit" do
    it "assigns the requested wish as @wish" do

      get :edit, {:id => wish.to_param}
      assigns(:wish).should eq(wish)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Wish" do
        expect {
          post :create, {:wish => valid_attributes}
        }.to change(Wish, :count).by(1)
      end

      it "assigns a newly created wish as @wish" do
        post :create, {:wish => valid_attributes}
        assigns(:wish).should be_a(Wish)
        assigns(:wish).should be_persisted
      end

      it "redirects to the created wish" do
        post :create, {:wish => valid_attributes}
        response.should redirect_to(wishes_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved wish as @wish" do
        # Trigger the behavior that occurs when invalid params are submitted
        Wish.any_instance.stub(:save).and_return(false)
        post :create, {:wish => {"need_amount" => "invalid value"}}
        assigns(:wish).should be_a_new(Wish)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Wish.any_instance.stub(:save).and_return(false)
        post :create, {:wish => {"need_amount" => "invalid value"}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested wish" do

        # Assuming there are no other wishes in the database, this
        # specifies that the Wish created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Wish.any_instance.should_receive(:update_attributes).with({"amount" => '1000'})
        put :update, {:id => wish.to_param, :wish => {"amount" => '1000'}}
      end

      it "assigns the requested wish as @wish" do

        put :update, {:id => wish.to_param, :wish => valid_attributes}
        assigns(:wish).should eq(wish)
      end

      it "redirects to the wish" do

        put :update, {:id => wish.to_param, :wish => valid_attributes}
        response.should redirect_to(wishes_path)
      end
    end

    describe "with invalid params" do
      it "assigns the wish as @wish" do

        # Trigger the behavior that occurs when invalid params are submitted
        Wish.any_instance.stub(:save).and_return(false)
        put :update, {:id => wish.to_param, :wish => {"amount" => "invalid value"}}
        assigns(:wish).should eq(wish)
      end

      it "re-renders the 'edit' template" do

        # Trigger the behavior that occurs when invalid params are submitted
        Wish.any_instance.stub(:save).and_return(false)
        put :update, {:id => wish.to_param, :wish => {"amount" => "invalid value"}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested wish" do

      expect {
        delete :destroy, {:id => wish.to_param}
      }.to change(Wish, :count).by(-1)
    end

    it "redirects to the wishes list" do

      delete :destroy, {:id => wish.to_param}
      response.should redirect_to(wishes_url)
    end
  end

end
