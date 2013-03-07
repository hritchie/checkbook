require 'spec_helper'

describe ChecksController do

  describe "GET index" do
    before(:each) do
      @check = FactoryGirl.create(:check)
    end

    it "assigns all checks as @checks" do
      get :index, account_id: @check.account_id
      assigns(:checks).should eq([@check])
    end

    it 'renders the index template' do
      get :index, account_id: @check.account_id
      response.should render_template :index
    end
  end

  describe "GET show" do
    before(:each) do
      @check = FactoryGirl.create(:check)
    end

    it "assigns the requested check as @check" do
      get :show, account_id: @check.account.id, id: @check
      assigns(:check).should eq(@check)
    end

    it "renders the #show view" do
      get :show, account_id: @check.account.id, id: @check
      response.should render_template :show
    end 
  end

  describe "GET new" do
    it "assigns a new check as @check" do
      account = FactoryGirl.create(:account)
      get :new, account_id: account.id
      assigns(:check).should be_a_new(Check)
    end
  end

  describe "GET edit" do
    it "assigns the requested check as @check" do
      @check = FactoryGirl.create(:check)
      get :edit, account_id: @check.account_id, id: @check
      assigns(:check).should eq(@check)
    end
  end

  describe "POST create" do
    describe "with valid attributes" do
      before(:each) do
        @account = FactoryGirl.create(:account)
      end
      it "creates a new Check" do
        expect {
          post :create, account_id: @account.id, check: FactoryGirl.attributes_for(:check)
        }.to change(Check, :count).by(1)
      end

      it "assigns a newly created check as @check" do
          post :create, account_id: @account.id, check: FactoryGirl.attributes_for(:check)
        assigns(:check).should be_a(Check)
        assigns(:check).should be_persisted
      end

      it "redirects to the created check" do
          post :create, account_id: @account.id, check: FactoryGirl.attributes_for(:check)
        response.should redirect_to(account_check_path(@account, Check.last))
      end
    end

    describe "with invalid attributes" do
      it "does not save the new check" do
        pending
        expect{
          post :create, check: FactoryGirl.attributes_for(:invalid_check)
        }.to_not change(Account, :count)
      end

      it "re-renders the 'new' template" do
        pending
        post :create, check: FactoryGirl.attributes_for(:invalid_check)
        response.should render_template :new
      end
    end
  end
end
