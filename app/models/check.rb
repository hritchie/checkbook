class Check < ActiveRecord::Base
  attr_accessible :amount, :payee

  validates :amount, :presence => true 
  validates :payee, :numericality => true
end
