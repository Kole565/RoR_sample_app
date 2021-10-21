require "test_helper"

class UserTest < ActiveSupport::TestCase

	def setup
		 # Valid user
		@user = User.new(name: "Bob Stivens", email: "bobStiv@gmail.com",
							password: "foobar", password_confirmation: "foobar")
	end
	
	test "should be valid" do
		assert @user.valid?
	end

	test "name should't be empty" do
		@user.name = " "
		assert_not @user.valid?
	end

	test "email should't be empty" do
		@user.email = " "
		assert_not @user.valid?
	end

	test "name should't be too long" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end

	test "email should't be too long" do
		@user.email = ("a" * 246) + "@gmail.com" # 256 in total
		assert_not @user.valid?
	end

	test "email validation should accept valid emails" do
		valid_emails = %w[user@example.com USER@foo.ru wsef_Sfd@test.COM 
			first.last@gn.cn]
		
		valid_emails.each do | email |
			@user.email = email
			assert @user.valid?, "#{email.inspect} should be valid"
		end
	end

	test "email validation should reject invalid emails" do
		invalid_emails = %w[userexample.com USER@foo,ru wsef_SfdtestCOM 
			first_last@g+n.cn USER@foo..ru]
		
		invalid_emails.each do | email |
			@user.email = email
			assert_not @user.valid?, "#{email.inspect} should be invalid"
		end
	end

	test "email should be unique" do
		user_dup = @user.dup
		user_dup.email = @user.email.upcase
		@user.save
		assert_not user_dup.valid?
	end

end
