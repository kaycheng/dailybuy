class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  has_many :likes
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments

  def is_liked?(user)
    self.liked_users.include?(user)
  end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%").order('id DESC')
    else
      all.includes(:user).order('id DESC')
    end
  end
end
