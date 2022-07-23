# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @moko = users(:moko)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user = User.new(email: 'foo@example.com', name: 'Foo Bar')
    assert_equal 'Foo Bar', user.name_or_email
  end

  test 'follow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test 'unfollow' do
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end

  test 'following?' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    assert_not @alice.following?(@moko)
  end

  test 'followed_by?' do
    assert_not @alice.followed_by?(@bob)
    @bob.follow(@alice)
    assert @alice.followed_by?(@bob)
    assert_not @alice.followed_by?(@moko)
  end
end
