require 'spec_helper'

describe ChecksController do
  before(:each) do
    @check = FactoryGirl.create(:check)
#    @account = @check.account
  end

  describe "GET index" do
    it "assigns all checks as @checks" do
      get :index, account_id: @check.account_id
      assigns(:checks).should eq([@check])
    end

    it 'renders the index template' do
      get :index, account_id: @check.account_id
      response.should render_template('index')
    end
  end
end
