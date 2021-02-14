class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  validates :name, presence: true, length: { in: 2..20 }, 
             uniqueness: true
  # validates :introduction, presence: true, length: { maximum: 50 }
  attachment :profile_image
  
  
  has_many :books, dependent: :destroy
  
end
