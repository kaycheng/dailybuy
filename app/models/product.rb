class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy
  belongs_to :category, optional: true

  def is_liked?(user)
    self.liked_users.include?(user)
  end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%").order('id DESC')
    else
      all.includes(:user, :likes, :category).order('created_at DESC').limit(12)
    end
  end
end
