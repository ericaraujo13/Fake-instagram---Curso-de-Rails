class PostsController < ApplicationController
  include SuggestedUsers

  before_action :set_post, only: %i[ show ]
  before_action :set_suggested_users, only: [:index]

  def index
    # flash.now[:alert] = "Falha"
    # flash.now[:notice] = "Exito"
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_param.merge(created_by: current_user))

    if @post.save
      PostChannel.broadcast_to "post_chanel", post_created: render_to_string(partial: @post)
      redirect_to @post, notice: "Post criado com sucesso."
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_param
    params.require(:post).permit( :photo, :description)
  end
end