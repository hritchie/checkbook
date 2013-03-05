require 'spec_helper'

describe ChecksController do
  before(:each) do
    @check = FactoryGirl.create(:check)
  end

  describe "GET index" do
    it "assigns all checks as @checks" do
      get :index
      assigns(:checks).should eq([@check])
    end

    it 'renders the index template' do
      get :index
      response.should render_template('index')
    end
  end
end
