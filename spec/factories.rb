# FactoryGirl.define do
#   factory :user do
#     name     "Michael Hartl"
#     email    "michael@example.com"
#     password "foobar"
#     password_confirmation "foobar"
#   end
# end

FactoryGirl.define do
  sequence :email do |n|
    "abced2#{n}@factory.com"
  end
  sequence :name do |n|
  	"name#{n}"
  end
  factory :user do
  	name
    email
    password "foobar"
    password_confirmation "foobar"
  end
end