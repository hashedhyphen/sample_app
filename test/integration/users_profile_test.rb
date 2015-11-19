require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
    @activated     = users(:michael)
    @non_activated = users(:non_activated)
  end

  test "show an activated user only" do
    # Activated user
    get user_path(@activated)
    assert_template 'users/show'
    # Non activated user
    get user_path(@non_activated)
    assert_redirected_to root_url
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    # User's name & logo
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match  @user.following.count.to_s, response.body
    # Stats
    assert_select "a[href=?]", following_user_path(@user)
    assert_match  @user.followers.count.to_s, response.body
    assert_select "a[href=?]", followers_user_path(@user)
    assert_match  @user.microposts.count.to_s, response.body
    # Feed
    assert_select 'div.pagination'
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end
