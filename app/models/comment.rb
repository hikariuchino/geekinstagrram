class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :favorites, dependent: :destroy
  has_many :favorited_comments, through: :favorites, source: :comment
  def already_favorited?(comment)
    self.favorites.exists?(comment_id: comment.id)
  end
end
