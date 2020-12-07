class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  acts_as_voter

  has_many :posts, dependent: :destroy

  def self.most_active
    joins(:posts).group(:id).order("count(*) desc")
  end
end
