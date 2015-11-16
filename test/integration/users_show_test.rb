require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
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
end
