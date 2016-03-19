class CartsController < ApplicationController
  def index
  end

  def checkout
    cart = current_user.current_cart
    cart.checkout
    redirect_to cart
  end

  def show
    @cart = Cart.find(params[:id])
  end
end
