require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    def setup
        @services = ["Housing","Food"]
        Rails::logger.debug "\n\n ***** User One ***** \n\n"
        @user1 = create(:user, :zip_code => "08004", :volunteer => "volunteer")
        @user1.update_attributes(:services => @services)
        Rails::logger.debug "\n\nUser One:#{@user1.inspect}\n\n"
        Rails::logger.debug "\n\n ***** User Two ***** \n\n"
        @user2 = create(:user, :zip_code => "08021", :volunteer => "in_need")
        @user2.update_attributes(:services => @services)
        Rails::logger.debug "\n\nUser One:#{@user2.inspect}\n\n"        
        @user3 = create(:user, :zip_code => "90210", :volunteer => "in_need")
        @user4 = create(:user, :zip_code => "08021", :volunteer => "volunteer")
        @user5 = create(:user, :zip_code => "08004", :volunteer => "in_need")
        @user6 = create(:user, :zip_code => "08021", :volunteer => "in_need")        
    end

    test "find_nearby_users() finds nearby users with different type" do
        Rails::logger.debug "\n\n *****\nfind nearby users outputs:\n#{find_nearby_users(@user1)}\n*****\n\n"
        assert find_nearby_users(@user1).include?(@user2)
    end

    test "find_nearby_users() does not find distant users with same type" do
        refute find_nearby_users(@user1).include?(@user3)
    end

    test "find_nearby_users() does not find self" do
        refute find_nearby_users(@user1).include?(@user1)
    end

    test "find_nearby_users() does not find nearby same type users" do
        refute find_nearby_users(@user1).include?(@user4)
        refute find_nearby_users(@user2).include?(@user5)
    end

end