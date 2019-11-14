module ProductsHelper

  def photo(product, size)
    image_tag product.photo.variant(resize: "#{size} x #{size}"), class: "image" if product.photo.attached?
  end
end
