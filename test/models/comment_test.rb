require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'valid comment' do
    bob = User.new(name: 'Bob', email: 'bob@bob.test', 
                    password: '123', is_admin: false)
    comment = Comment.new(content: 'Foo Bar', user: bob, likes: 0, dislikes: 0)
    assert comment.valid?
  end
end
