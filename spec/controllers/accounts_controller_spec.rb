require 'spec_helper'

describe AccountsController do

  describe "GET index" do
    it "assigns all accounts as @accounts" do
      account = FactoryGirl.create(:account)
      get :index
      assigns(:accounts).should eq([account])
    end

    it 'renders the index template' do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested account as @account" do
      account = FactoryGirl.create(:account)
      get :show, id: account.id
      assigns(:account).should eq(account)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:account)
      response.should render_template :show
    end 
  end

  describe "GET new" do
    it "assigns a new account as @account" do
      get :new
      assigns(:account).should be_a_new(Account)
    end
  end

  describe "GET edit" do
    it "assigns the requested account as @account" do
      account = FactoryGirl.create(:account)
      get :edit, id: account.id
      assigns(:account).should eq(account)
    end
  end

  describe "POST create" do
    describe "with valid attributes" do
      it "creates a new Account" do
        expect {
          post :create, account: FactoryGirl.attributes_for(:account)
        }.to change(Account, :count).by(1)
      end

      it "assigns a newly created account as @account" do
        post :create, account: FactoryGirl.attributes_for(:account)
        assigns(:account).should be_a(Account)
        assigns(:account).should be_persisted
      end

      it "redirects to the created account" do
        post :create, account: FactoryGirl.attributes_for(:account)
        response.should redirect_to(Account.last)
      end
    end

    describe "with invalid attributes" do
      it "does not save the new account" do
        expect{
          post :create, account: FactoryGirl.attributes_for(:invalid_account)
        }.to_not change(Account, :count)
      end

      it "re-renders the 'new' template" do
        post :create, account: FactoryGirl.attributes_for(:invalid_account)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @account = FactoryGirl.create(:account, name: 'Test Account Name')
    end

    describe "with valid attributes" do
      it 'should locate the requested @account' do
        put :update, id: @account, account: FactoryGirl.attributes_for(:account)
        assigns(:account).should eq(@account)
      end

      it "updates the requested account" do
        put :update, id: @account, 
          account: FactoryGirl.attributes_for(:account, name: 'Changed Acct. Name')
        @account.reload
        @account.name.should eq('Changed Acct. Name')
      end


      it "redirects to the updated account" do
        put :update, id: @account, account: FactoryGirl.attributes_for(:account)
        response.should redirect_to @account
      end
    end

    describe "with invalid params" do
      it "locates the requested @account" do
        put :update, id: @account, 
          account: FactoryGirl.attributes_for(:invalid_account)
        assigns(:account).should eq(@account)
      end

      it "re-renders the 'edit' template" do
        put :update, id: @account, 
          account: FactoryGirl.attributes_for(:invalid_account)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @account = FactoryGirl.create(:account)
    end

    it "destroys the requested account" do
      expect {
        delete :destroy, id: @account
      }.to change(Account, :count).by(-1)
    end

    it "redirects to the accounts list" do
      delete :destroy, id: @account
      response.should redirect_to accounts_url
    end
  end
end
