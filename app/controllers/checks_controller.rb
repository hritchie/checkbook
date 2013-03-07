class ChecksController < ApplicationController
  # GET /checks
  # GET /checks.json
  def index
    @account = Account.find(params[:account_id])
    @checks = @account.checks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checks }
    end
  end

  # GET /checks/1
  # GET /checks/1.json
  def show
    @account = Account.find(params[:account_id])
    @check = @account.checks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @check }
    end
  end

  # GET /checks/new
  # GET /checks/new.json
  def new
    @account = Account.find(params[:account_id])
    @check = Check.new
    @check.account = @account

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @check }
    end
  end

  # GET /checks/1/edit
  def edit
    @account = Account.find(params[:account_id])
    @check = @account.checks.find(params[:id])
  end

  # POST /checks
  # POST /checks.json
  def create
    @account = Account.find(params[:account_id])
    @check = Check.new(params[:check])
    @check.account_id = @account.id
    

    respond_to do |format|
      if @check.save
        format.html { redirect_to account_check_path(@account, @check), notice: 'Check was successfully created.' }
        format.json { render json: @check, status: :created, location: @check }
      else
        format.html { render action: "new" }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checks/1
  # PUT /checks/1.json
  def update
    @account = Account.find(params[:account_id])
    @check = @account.checks.find(params[:id])

    respond_to do |format|
      if @check.update_attributes(params[:check])
        format.html { redirect_to account_check_path(@account.id, @check), notice: 'Check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checks/1
  # DELETE /checks/1.json
  def destroy
    @account = Account.find(params[:account_id])
    @check = @account.checks.find(params[:id])
    @check.destroy

    respond_to do |format|
      format.html { redirect_to checks_url }
      format.json { head :no_content }
    end
  end
end
