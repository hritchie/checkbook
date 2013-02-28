class Check < ActiveRecord::Base
  attr_accessible :amount, :payee

  validates :payee, :presence => true 
  validates :amount, :numericality => true
end
