class StoreController < ApplicationController
  def index
    @items = Item.all
    @categories = Category.all 
  end
end
