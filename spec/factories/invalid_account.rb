FactoryGirl.define do
  factory :invalid_account, parent: :account do
    name nil 
  end
end


