class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  has_many :book_comments
  has_many :favorites
  belongs_to :user
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
