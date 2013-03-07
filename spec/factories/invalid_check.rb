FactoryGirl.define do
  factory :invalid_check, parent: :check do 
    payee 'bad check'
    amount nil
    account
  end
end
