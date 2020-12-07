class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  acts_as_voter

  has_many :posts, dependent: :destroy

  validates :username, presence: true

  def posts_count
    posts.count
  end

  def self.most_active
    joins(:posts).group(:id).order("count(*) desc")
  end
end
