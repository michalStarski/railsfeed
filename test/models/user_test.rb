require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:sample)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
  end

  test 'invalid without password' do
    @user.password = nil
    refute @user.valid?
  end

  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?
  end

  test 'invalid with password not in between 6 and 20 chars' do
    @user.password = '1'
    refute @user.valid?
    @user.password = '12345jksjdahdkadhsajkfndjkabvjbdjjsvajdbva'
    refute @user.valid?
  end

  test 'invalid with name that has 1 character' do
    @user.name = 'a'
    refute @user.valid?
  end
end
