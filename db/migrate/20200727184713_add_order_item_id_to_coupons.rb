class AddOrderItemIdToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_reference :coupons, :order_item, foreign_key: true
  end
end
