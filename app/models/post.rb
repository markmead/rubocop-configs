class Post < ApplicationRecord
  acts_as_ordered_taggable_on :tags
  acts_as_votable

  belongs_to :user

  scope :live, -> { where(live: true) }
end
