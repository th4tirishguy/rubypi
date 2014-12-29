class SessionController < ApplicationController
  def new
  	if session[:logged_in].nil?
  	else
  		flash[:alert] = "You are already logged in"
  		redirect_to :root
  	end
  end

  def create
  	@user = User.authenticate(params["/login"][:username], params["/login"][:password])
  	if @user
  		session[:logged_in] = true
  		session[:user_access_level] = @user.access_level
  		flash[:notice] = "Logged in"
  		redirect_to :root
  	else
  		flash.now[:alert] = "There was a problem logging you in"
  		render 'new'
  	end
  end

  def destroy
  	if !session[:logged_in].nil?
	  	session[:logged_in] = nil
	  	session[:user_access_level] = nil
	  	flash[:notice] = "Logged out"
	  	redirect_to :root
	else
		redirect_to :root
	end
  end
end
