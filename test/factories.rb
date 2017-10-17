FactoryGirl.define do
    factory :user1, class: User do
        first_name "John"
        last_name "Butts"
        password "password"
        email "example1@website.com"
        zip_code "08004"
    end

    factory :user2, class: User do
        first_name "Seymore"
        last_name "Butts"
        password "password"
        email "example2@website.com"
        zip_code "08021"
    end 

    factory :user do
        first_name "Jorge"
        last_name "Tubungus"
        email "user@website.com"
        password "password"
        zip_code "08004"
    end

    factory :user3, class: User do
        first_name "Autumn"
        last_name "Butts"
        password "password"
        email "example3@website.com"
        zip_code "90210"
    end  
end