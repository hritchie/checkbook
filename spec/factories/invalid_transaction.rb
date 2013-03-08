FactoryGirl.define do
  factory :invalid_transaction, parent: :transaction do 
    payee 'bad transaction'
    amount nil
    account
  end
end
