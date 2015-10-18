require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  default_title = "Ruby on Rails Tutorial Sample App"

  test "full title helper" do
    assert_equal full_title,         default_title
    assert_equal full_title("Help"), "Help | #{default_title}"
  end
end
