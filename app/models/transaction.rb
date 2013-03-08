class Transaction < ActiveRecord::Base
  belongs_to :account
  attr_accessible :amount, :payee, :account_id




  validates :account, :presence => true
  validates :payee, :presence => true 
  validates_numericality_of :amount, :greater_than => 0, :only_integer => true

  def account_name
    self.account.name
  end
end
