class UserController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new
  	@user.username = params["/signup"][:username]
  	@user.email = params["/signup"][:email]
  	@user.access_level = 1
  	@user.encrypt_password(params["/signup"][:password])
  	if @user.save
  		flash[:notice] = "Thanks for signing up"
  		redirect_to :root
  	else
  		flash.now[:alert] = "There was a problem signing up"
  		render new
  	end
  end
end
