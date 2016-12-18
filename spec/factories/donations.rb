FactoryGirl.define do
  factory :donation do
    amount 1.5
    transaction_state "MyString"
    donor_email "MyString"
    student_email "MyString"
  end
end
