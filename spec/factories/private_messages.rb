# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :private_message do
    sender 1
    recipient 1
    message "MyText"
    unread false
  end
end
