class AddEventIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :event, foreign_key: true
  end
end
