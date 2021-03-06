class User < ApplicationRecord
	VALID_EMAIL_REGEXP = /\b[^\s]+@[^+\s.,]+\.[^+\s.,]+\b/
	
	before_save { self.email = email.downcase }

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }, 
					  format: { with: VALID_EMAIL_REGEXP }, 
					  uniqueness: { case_sensitive: false }
	
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	
end
