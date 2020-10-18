class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all

    if params[:search]
      render partial: "tags/tag_list", locals: { tags: @tags }
    end
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @posts = Post.all.tagged_with(@tag)
  end
end
