class User < ActiveRecord::Base
	has_many :posts
	attr_accessor :password

	def self.authenticate(username, password)
		@user = User.find_by(username: username)
		if @user && @user.password_hash == BCrypt::Engine.hash_secret(password, @user.password_salt)
			@user
		else
			nil
		end
	end

	def encrypt_password(password)
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, self.password_salt)
	end
end
