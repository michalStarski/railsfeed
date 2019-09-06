require 'test_helper'

class SubTest < ActiveSupport::TestCase
  def setup
    @sub = subs(:sample)
  end

  test 'valid sub' do
    assert @sub.valid?
  end

  test 'invalid without name' do
    @sub.name = nil
    refute @sub.valid?
  end
end
