class PostsController < ApplicationController

  def index
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]
    
    if @post.save
      redirect_to 'index'
    else
      render action: 'index'
    end
  end

end
