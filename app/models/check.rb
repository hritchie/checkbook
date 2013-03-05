class Check < ActiveRecord::Base
  attr_accessible :amount, :payee

  validates :payee, :presence => true 
  validates_numericality_of :amount, :greater_than => 0, :only_integer => true
end
