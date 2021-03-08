class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user


	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end


  def self.search_for(content, how)
    if how == 'perfect'
      Book.where(title: content)
    elsif how == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif how == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
  end


end
