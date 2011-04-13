class PostsController < ApplicationController

  before_filter :load_posts, only: :index

  def index
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]
    
    if @post.save
      redirect_to :back
    else
      load_posts
      render 'index'
    end
  end

  private

  def load_posts
    @posts = Post.all(order: 'created_at desc')
  end

end
