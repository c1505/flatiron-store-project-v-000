class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.inject(0) {|sum, line_item| sum + (line_item.item.price * line_item.quantity ) }
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
end
