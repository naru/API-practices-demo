class Api::V2::PostsController < API::V2::ApplicationController

  def index
    @posts = Post.all

    respond_with @posts
  end

end
