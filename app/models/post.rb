class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders]

  acts_as_ordered_taggable_on :tags
  acts_as_votable

  has_rich_text :description

  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validate :tag_list_count

  scope :live, -> { where(live: true) }

  scope :search, ->(search) { select { |post| post.title.downcase.include?(search.downcase) } }

  def live?
    live
  end

private

  def tag_list_count
    errors[:tag_list] << "is too short (minimum is 1 tag)" if tag_list.count < 1
    errors[:tag_list] << "is too long (maximum is 4 tags)" if tag_list.count > 4
  end
end
