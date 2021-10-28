require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "should't register invalid user" do		
		get signup_path

		assert_no_difference "User.count" do
			User.new(
				{
					name: "",
					email: "invalid@mail",
					password: "foo",
					password_confirmation: "bar" 
				}
			)
		end

		assert_template "users/new"
	end
	
end
