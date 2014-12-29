class StaticPageController < ApplicationController
  def home
  	@posts = Post.all.limit(10).order(created_at: :desc)
  end

  def project
  end

  def hardware
  end

  def contact
  end
end
