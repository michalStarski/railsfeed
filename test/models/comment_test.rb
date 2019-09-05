require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @bob = User.new(name: 'Bob', email: 'bob@bob.test',
                    password: '123', is_admin: false)
    @comment = Comment.new(content: 'Foo Bar', user: @bob)
  end

  test 'valid comment' do
    assert @comment.valid?
  end

  test 'invalid without content' do
    @comment.content = nil
    refute @comment.valid?
  end

  test 'has likes and dislikes count set to 0 on default' do
    assert_equal @comment.likes, 0
    assert_equal @comment.dislikes, 0
  end
end
