require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:sample)
  end

  test 'valid post' do
    assert @post.valid?
  end

  test 'invalid without content' do
    @post.content = nil
    refute @post.valid?
  end

  test 'invalid without title' do
    @post.title = nil
    refute @post.valid?
  end

  test 'invalid without sub' do
    @post.sub = nil
    refute @post.valid?
  end

  test 'invalid without author' do
    @post.user = nil
    refute @post.valid?
  end

  test 'has likes and dislikes set to 0 by default' do
    assert_equal @post.likes, 0
    assert_equal @post.dislikes, 0
  end
end
