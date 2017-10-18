require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    def setup
        @user1 = create(:user, :zip_code => "08004")
        @user2 = create(:user, :zip_code => "08021")
        @user3 = create(:user, :zip_code => "90210")
    end

    test "nearby users" do
        assert find_nearby_users(@user1).include?(@user2)
        refute find_nearby_users(@user1).include?(@user3)
    end
end