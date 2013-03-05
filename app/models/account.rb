class Account < ActiveRecord::Base
  attr_accessible :name
  before_create :init

  def init
    self.initial_balance = 0
  end

  def balance
    initial_balance
  end
end
