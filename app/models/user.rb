class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, length: { in: 2..20 },
             uniqueness: true
  validates :introduction, length: { maximum: 50 }
  attachment :profile_image


  has_many :books, dependent: :destroy
  has_many :book_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy
  
  has_many :following_user, through: :follower, souce: :followed
  has_many :follower_user, through: :followed, souce: :follower
  
  
  
end


