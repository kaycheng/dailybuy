class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_one_attached :avatar
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :product

  has_many :comments
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  def following?(user)
    self.followings.include?(user)
  end
end
