require 'spec_helper'

describe Transaction do
  before(:each) do
    @transaction = FactoryGirl.create(:transaction)
#    @transaction = Transaction.new
  end

  it "has a valid factory" do
    @transaction.should be_valid 
  end

  context "Every transaction" do
    it 'returns its payee' do
      @transaction.payee.should eq('mr. payee')
    end
    it 'returns its amount' do
      @transaction.amount.should equal(10)
    end
  end
  
  context 'A valid transaction' do
    it 'has a payee' do
      @transaction.payee = nil
      @transaction.valid?.should be_false
      @transaction.should have(1).errors_on(:payee)
    end
    it 'has an amount' do
      @transaction.amount = nil
      @transaction.valid?.should be_false
      @transaction.should have(1).errors_on(:amount)
    end
    it 'has a numeric amount' do
      @transaction.amount = 'some string'
      @transaction.valid?.should be_false
      @transaction.should have(1).errors_on(:amount)
    end
    it 'has a non-negative amount' do
      @transaction.amount = -1
      @transaction.valid?.should be_false
      @transaction.should have(1).errors_on(:amount)
    end
    it 'has a non-zero amount' do
      @transaction.amount = 0
      @transaction.valid?.should be_false
      @transaction.should have(1).errors_on(:amount)
    end
    it 'has an integer amount' do
      @transaction.amount = 1.6 
      @transaction.valid?.should be_false
      @transaction.should have(1).errors_on(:amount)
    end
    it 'is associated with and account' do
      @transaction.account.should be_an_instance_of(Account)
    end
    it 'returns its account name' do
      account = FactoryGirl.create(:account)
      account.name = "account_name_string"
      @transaction.account = account
      @transaction.account_name.should eq('account_name_string')
    end
  end
end
