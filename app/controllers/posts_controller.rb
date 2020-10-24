class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy like]
  before_action :authenticate_user!, only: %i[new edit create update destroy like]

  def index
    @posts = Post.live
    @posts = @posts.search(params[:search]) if params[:search]
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render partial: "form", status: :unprocessable_entity, locals: { model: @post, title: "New post" }
    end
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Post was successfully updated."
    else
      render partial: "form", status: :unprocessable_entity, locals: { model: @post, title: "Edit #{@post.title}" }
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Post was successfully destroyed." }
    end
  end

  def like
    if current_user.voted_for? @post
      @post.unliked_by current_user
    else
      @post.liked_by current_user
    end

    render partial: "posts/like", locals: { post: @post }
  end

private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :live, :gem, :config, :user_id, :tag_list, :description)
  end
end
