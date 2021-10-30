require "test_helper"

class ApplicationHelperTest < ActionDispatch::IntegrationTest

	test "full_title" do
		assert_equal full_title(), "Ruby on Rails Tutorial Sample App"
		assert_equal full_title("test name"), "test name | Ruby on Rails Tutorial Sample App"
	end
	
end