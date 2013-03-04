require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ChecksController do

  # This should return the minimal set of attributes required to create a valid
  # Check. As you add validations to Check, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "payee" => "MyString", 
      "amount" => 1 }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ChecksController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all checks as @checks" do
      check = Check.create! valid_attributes
      get :index, {}, valid_session
      assigns(:checks).should eq([check])
    end
  end

  describe "GET show" do
    it "assigns the requested check as @check" do
      check = Check.create! valid_attributes
      get :show, {:id => check.to_param}, valid_session
      assigns(:check).should eq(check)
    end
  end

  describe "GET new" do
    it "assigns a new check as @check" do
      get :new, {}, valid_session
      assigns(:check).should be_a_new(Check)
    end
  end

  describe "GET edit" do
    it "assigns the requested check as @check" do
      check = Check.create! valid_attributes
      get :edit, {:id => check.to_param}, valid_session
      assigns(:check).should eq(check)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Check" do
        expect {
          post :create, {:check => valid_attributes}, valid_session
        }.to change(Check, :count).by(1)
      end

      it "assigns a newly created check as @check" do
        post :create, {:check => valid_attributes}, valid_session
        assigns(:check).should be_a(Check)
        assigns(:check).should be_persisted
      end

      it "redirects to the created check" do
        post :create, {:check => valid_attributes}, valid_session
        response.should redirect_to(Check.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved check as @check" do
        # Trigger the behavior that occurs when invalid params are submitted
        Check.any_instance.stub(:save).and_return(false)
        post :create, {:check => { "payee" => "invalid value" }}, valid_session
        assigns(:check).should be_a_new(Check)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Check.any_instance.stub(:save).and_return(false)
        post :create, {:check => { "payee" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested check" do
        check = Check.create! valid_attributes
        # Assuming there are no other checks in the database, this
        # specifies that the Check created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Check.any_instance.should_receive(:update_attributes).with({ "payee" => "MyString" })
        put :update, {:id => check.to_param, :check => { "payee" => "MyString" }}, valid_session
      end

      it "assigns the requested check as @check" do
        check = Check.create! valid_attributes
        put :update, {:id => check.to_param, :check => valid_attributes}, valid_session
        assigns(:check).should eq(check)
      end

      it "redirects to the check" do
        check = Check.create! valid_attributes
        put :update, {:id => check.to_param, :check => valid_attributes}, valid_session
        response.should redirect_to(check)
      end
    end

    describe "with invalid params" do
      it "assigns the check as @check" do
        check = Check.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Check.any_instance.stub(:save).and_return(false)
        put :update, {:id => check.to_param, :check => { "payee" => "invalid value" }}, valid_session
        assigns(:check).should eq(check)
      end

      it "re-renders the 'edit' template" do
        check = Check.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Check.any_instance.stub(:save).and_return(false)
        put :update, {:id => check.to_param, :check => { "payee" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested check" do
      check = Check.create! valid_attributes
      expect {
        delete :destroy, {:id => check.to_param}, valid_session
      }.to change(Check, :count).by(-1)
    end

    it "redirects to the checks list" do
      check = Check.create! valid_attributes
      delete :destroy, {:id => check.to_param}, valid_session
      response.should redirect_to(checks_url)
    end
  end

end
