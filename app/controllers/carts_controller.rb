class CartsController < ApplicationController
  def index
  end

  def checkout
    cart = current_user.current_cart
    current_user.current_cart = nil

    cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    redirect_to cart
  end
end
