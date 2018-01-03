require 'test_helper'

class UserTest < ActiveSupport::TestCase
  

  def setup
    @built = build(:user, :volunteer => "volunteer")
    @created = create(:user, :volunteer => "volunteer")
  end

  test 'valid user' do
    assert @built.valid?
  end

  test 'invalid without first name' do
    @built.first_name = nil
    refute @built.valid?, 'user is valid without a first name'
    assert_not_nil @built.errors[:first_name], 'no validation error for first name present'
  end

  test 'invalid without last name' do
    @built.last_name = nil
    refute @built.valid?, 'user is valid without a last name'
    assert_not_nil @built.errors[:last_name], 'no validation error for last name present'
  end

  test 'invalid without email' do
    @built.email = nil
    refute @built.valid?, 'user is valid without an email'
    assert_not_nil @built.errors[:email], 'no validation error for email present'
  end

  test "zip produces correct lat and long" do
    assert_equal(39.764747 - 74.870626, @created.lat + @created.long)
  end
end
