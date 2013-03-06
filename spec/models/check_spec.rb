require 'spec_helper'

describe Check do
  before(:each) do
    @check = FactoryGirl.create(:check)
#    @check = Check.new
  end

  it "has a valid factory" do
    @check.should be_valid 
  end

  context "Every check" do
    it 'returns its payee' do
      @check.payee.should eq('mr. payee')
    end
    it 'returns its amount' do
      @check.amount.should equal(10)
    end
  end
  
  context 'A valid check' do
    it 'has a payee' do
      @check.payee = nil
      @check.valid?.should be_false
      @check.should have(1).errors_on(:payee)
    end
    it 'has an amount' do
      @check.amount = nil
      @check.valid?.should be_false
      @check.should have(1).errors_on(:amount)
    end
    it 'has a numeric amount' do
      @check.amount = 'some string'
      @check.valid?.should be_false
      @check.should have(1).errors_on(:amount)
    end
    it 'has a non-negative amount' do
      @check.amount = -1
      @check.valid?.should be_false
      @check.should have(1).errors_on(:amount)
    end
    it 'has a non-zero amount' do
      @check.amount = 0
      @check.valid?.should be_false
      @check.should have(1).errors_on(:amount)
    end
    it 'has an integer amount' do
      @check.amount = 1.6 
      @check.valid?.should be_false
      @check.should have(1).errors_on(:amount)
    end
    it 'is associated with and account' do
      pending
      @check.account.should_be instance_of(Account)
    end
  end
end
