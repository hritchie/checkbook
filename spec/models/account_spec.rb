require 'spec_helper'

describe Account do
  before(:each) do
    @account = FactoryGirl.create(:account)
  end

  it "has a valid factory" do
    @account.should be_valid 
  end
end
