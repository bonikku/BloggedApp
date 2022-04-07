require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'User', email: 'user@user.com', password: 'password')
    # @admin = User.create(username: 'Admin', email: 'admin@user.com', password: 'password', admin: true)
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.username = ' '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'password should be present' do
    @user.password = ' '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.username = 'a' * 54
    assert_not @user.valid?
  end

  test 'name should not be too short' do
    @user.username = 'a'
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 101
    assert_not @user.valid?
  end

  test 'email should match the regex' do
    @user.email = 'email£mail.com'
    assert_not @user.valid?
  end

  test 'password should not be too long' do
    @user.password = 'a' * 80
    assert_not @user.valid?
  end

  test 'password should not be too short' do
    @user.password = 'a'
    assert_not @user.valid?
  end
end