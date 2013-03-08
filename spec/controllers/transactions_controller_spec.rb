require 'spec_helper'

describe TransactionsController do

  describe "GET index" do
    before(:each) do
      @transaction = FactoryGirl.create(:transaction)
    end

    it "assigns all transactions as @transactions" do
      get :index, account_id: @transaction.account_id
      assigns(:transactions).should eq([@transaction])
    end

    it 'renders the index template' do
      get :index, account_id: @transaction.account_id
      response.should render_template :index
    end
  end

  describe "GET show" do
    before(:each) do
      @transaction = FactoryGirl.create(:transaction)
    end

    it "assigns the requested transaction as @transaction" do
      get :show, account_id: @transaction.account.id, id: @transaction
      assigns(:transaction).should eq(@transaction)
    end

    it "renders the #show view" do
      get :show, account_id: @transaction.account.id, id: @transaction
      response.should render_template :show
    end 
  end

  describe "GET new" do
    it "assigns a new transaction as @transaction" do
      account = FactoryGirl.create(:account)
      get :new, account_id: account.id
      assigns(:transaction).should be_a_new(Transaction)
    end
  end

  describe "GET edit" do
    it "assigns the requested transaction as @transaction" do
      @transaction = FactoryGirl.create(:transaction)
      get :edit, account_id: @transaction.account_id, id: @transaction
      assigns(:transaction).should eq(@transaction)
    end
  end

  describe "POST create" do
    before(:each) do
      @account = FactoryGirl.create(:account)
    end
    describe "with valid attributes" do
      it "creates a new Transaction" do
        expect {
          post :create, account_id: @account.id, transaction: FactoryGirl.attributes_for(:transaction)
        }.to change(Transaction, :count).by(1)
      end

      it "assigns a newly created transaction as @transaction" do
          post :create, account_id: @account.id, transaction: FactoryGirl.attributes_for(:transaction)
        assigns(:transaction).should be_a(Transaction)
        assigns(:transaction).should be_persisted
      end

      it "redirects to the created transaction" do
          post :create, account_id: @account.id, transaction: FactoryGirl.attributes_for(:transaction)
        response.should redirect_to(account_transaction_path(@account, Transaction.last))
      end
    end

    describe "with invalid attributes" do
      it "does not save the new transaction" do
        expect{
          post :create, account_id: @account.id, transaction: FactoryGirl.attributes_for(:invalid_transaction)
        }.to_not change(Account, :count)
      end

      it "re-renders the 'new' template" do
        post :create, account_id: @account.id, transaction: FactoryGirl.attributes_for(:invalid_transaction)
        response.should render_template :new
      end
    end
  end

  describe 'PUT update' do
    before(:each) do
      @transaction = FactoryGirl.create(:transaction, payee: "Updatable Payee")
    end

    context 'with valid attributes' do
      it 'locates the requested @transaction' do
        put :update, account_id: @transaction.account_id, 
          id: @transaction, transaction: FactoryGirl.attributes_for(:transaction)
        assigns(:transaction).should eq(@transaction)
      end

      it 'updated the requested transaction' do
        put :update, account_id: @transaction.account_id, 
          id: @transaction, transaction: FactoryGirl.attributes_for(:transaction, payee: 'changed payee')
        @transaction.reload
        @transaction.payee.should eq('changed payee')
      end

      it 'redirects to the updated transaction' do
        put :update, account_id: @transaction.account_id, 
          id: @transaction, transaction: FactoryGirl.attributes_for(:transaction)
        response.should redirect_to(account_transaction_path(@transaction.account, @transaction))
      end
    end

    context 'with invalid params' do
      it 'locates the requested transaction' do
        put :update, account_id: @transaction.account_id, 
          id: @transaction, transaction: FactoryGirl.attributes_for(:invalid_transaction)
        assigns(:transaction).should eq(@transaction)
      end

      it "re-renders the 'edit' template" do
        put :update, account_id: @transaction.account_id, 
          id: @transaction, transaction: FactoryGirl.attributes_for(:invalid_transaction)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @transaction = FactoryGirl.create(:transaction)
    end

    it 'destroys the requested transaction' do
      expect {
        delete :destroy, account_id: @transaction.account_id, id: @transaction
      }.to change(Transaction, :count).by(-1)
    end

    it "redirects to the account's transactions list" do
        delete :destroy, account_id: @transaction.account_id, id: @transaction
        response.should redirect_to account_transactions_url(@transaction.account)
    end
  end
end
