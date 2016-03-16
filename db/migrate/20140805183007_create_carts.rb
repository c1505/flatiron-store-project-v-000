class CreateCarts < ActiveRecord::Migration
  def change
    create_table :cart do |t|
      t.integer :user_id
    end
  end
end
