class Api::V1::PostsController < API::V1::ApplicationController
  
  before_filter :parse_body_json, only: :create

  def index
    @posts = Post.all

    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])

    respond_with @post
  end

  def create
    @post = Post.new_through_api(@attributes['post'])
    @post.save

    respond_with @post
  end

end
