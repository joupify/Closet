module ProductsHelper
  def product_name(product)
    user_signed_in? && current_user.id == product.user_id
  end
end
