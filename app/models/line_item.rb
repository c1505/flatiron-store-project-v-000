class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def update_inventory
    item.inventory -= quantity
    item.save
  end
end
