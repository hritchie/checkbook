class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @account = Account.find(params[:account_id])
    @transactions = @account.transactions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @account = Account.find(params[:account_id])
    @transaction = Transaction.new
    @transaction.account = @account

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.build(params[:transaction])
    

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to account_transaction_path(@account.id, @transaction.id), notice: 'Transaction was successfully created.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to account_transaction_path(@transaction.account, @transaction), notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to account_transactions_path(@account) }
      format.json { head :no_content }
    end
  end
end
