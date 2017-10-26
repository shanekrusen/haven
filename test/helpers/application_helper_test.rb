require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    def setup
        @user1 = create(:user, :zip_code => "08004")
        @user2 = create(:user, :zip_code => "08021")
        @user3 = create(:user, :zip_code => "90210")
    end

    test "find_nearby_users() finds nearby users" do
        assert find_nearby_users(@user1).include?(@user2)
    end

    test "find_nearby_users() does not find distant users" do
        refute find_nearby_users(@user1).include?(@user3)
    end

    test "find_nearby_users() does not find self" do
        refute find_nearby_users(@user1).include?(@user1)
    end

end