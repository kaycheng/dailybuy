class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :product

  has_many :comments, dependent: :destroy
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  has_many :inverse_followships, dependent: :destroy, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user

  def following?(user)
    self.followings.include?(user)
  end

  def admin?
    self.role == "admin"
  end
end
