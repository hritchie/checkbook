class Account < ActiveRecord::Base
  has_many :transactions
  attr_accessible :name
  validates :name, presence: true
  before_create :init

  def init
    self.initial_balance = 0
  end

  def balance
    initial_balance
  end
end
