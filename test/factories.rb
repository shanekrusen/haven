FactoryGirl.define do
    factory :user do
        sequence(:first_name) { |n| "user_first#{n}" } 
        sequence(:last_name) { |n| "user_last#{n}" }
        sequence(:email) { |n| "user#{n}@website.com" }
        password "password"
        zip_code "08004"
    end
end