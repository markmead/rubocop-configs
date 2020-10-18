class Post < ApplicationRecord
  acts_as_ordered_taggable_on :tags
  acts_as_votable

  has_rich_text :description

  belongs_to :user

  scope :live, -> { where(live: true) }

  scope :search, ->(search) { select { |post| post.title.downcase.include?(search.downcase) } }

  def live?
    live
  end
end
