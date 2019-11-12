module UsersHelper
  def avatar(user, size)
    image_tag user.avatar.variant(resize: "#{size} x #{size}") if user.avatar.attached?
  end
end
