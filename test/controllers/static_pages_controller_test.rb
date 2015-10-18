require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  default_title = "Ruby on Rails Tutorial Sample App"

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", default_title
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{default_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{default_title}"
  end

  test "shold get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{default_title}"
  end
end
