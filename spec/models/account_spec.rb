require 'spec_helper'

describe Account do
  before(:each) do
    @account = FactoryGirl.create(:account)
  end

  it "has a valid factory" do
    @account.should be_valid 
  end

  context "A new account" do
    it "has a zero initial balance" do
      @account.balance.should equal(0)
    end
  end

end
