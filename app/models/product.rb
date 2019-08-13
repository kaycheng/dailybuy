class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  has_many :likes
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def is_liked?(user)
    self.liked_users.include?(user)
  end
end
