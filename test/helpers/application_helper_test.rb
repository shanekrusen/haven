require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
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

        factory :user3, class: User do
            first_name "Autumn"
            last_name "Butts"
            password "password"
            email "example3@website.com"
            zip_code "90210"
        end  
    end

    def setup
        @user1 = create(:user1)
        @user2 = create(:user2)
        @user3 = create(:user3)
    end

    test "nearby users" do
        assert find_nearby_users(@user1).include?(@user2)
        refute find_nearby_users(@user1).include?(@user3)
    end
end