require 'spec_helper'

describe Check do
  context "Every check" do
    it 'has a payee' do
      c = Check.new
      c.valid?.should be_false
      c.should have(1).errors_on(:payee)
    end
    it 'has an amount' do
      c = Check.new
      c.should have(1).errors_on(:amount)
    end
  end
end
