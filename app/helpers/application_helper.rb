module ApplicationHelper
  def current_post
    @post.present?
  end
end
