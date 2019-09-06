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
end
