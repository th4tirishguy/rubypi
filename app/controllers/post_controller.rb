class PostController < ApplicationController
  def new
    if !session[:logged_in].nil? && session[:user_access_level] == 1
  	 @post = Post.new
    else
      redirect_to :root
    end
  end

  def create
  	@post = Post.new
  	@post.title = params[:post][:title]
  	@post.body = params[:post][:body]
  	@post.author = "Mark"
  	@post.slug = params[:post][:title].gsub(/[ ]/, '-').downcase
  	if @post.save
  		redirect_to post_path(@post.slug)
  	else
  		render "post/new"
  	end
  end

  def show
  	@post = Post.find_by(slug: params[:slug])
  end
end
