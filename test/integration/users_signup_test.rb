require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "should't register invalid user" do		
		get signup_path

		assert_no_difference "User.count" do
			user = User.new(
				{
					name: "",
					email: "invalid@mail",
					password: "foo",
					password_confirmation: "bar" 
				}
			)
			user.save
		end

		assert_template "users/new"
	end

	test "should register valid user" do
		get signup_path

		assert_difference "User.count" do
			user = User.new(
				{
					name: "Joe",
					email: "valid@gmail.com",
					password: "password",
					password_confirmation: "password" 
				}
			)
			user.save
		end

		assert_template "users/new"
	end
	
end
