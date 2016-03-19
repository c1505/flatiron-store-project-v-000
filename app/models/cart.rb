class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.map {|line_item| line_item.item.price * line_item.quantity}.reduce(:+)
  end

  def add_item(item_id)
    line_item = LineItem.find_by(cart_id: self.id, item_id: item_id)
    if line_item.nil?
      line_item = LineItem.new(cart_id: self.id, item_id: item_id, quantity: 1)
    else
      line_item.quantity += 1
    end
    line_item
  end

  def checkout
    line_items.each do |line_item|
      line_item.update_inventory
    end
    user.current_cart.status = "submitted"
    user.current_cart.save
    user.current_cart = nil
  end
end
