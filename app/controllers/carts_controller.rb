class CartsController < ApplicationController
	skip_after_action :verify_authorized

  def show
  	@order_items = current_order.order_items
  	@event = Event.friendly.find(params[:id])

  	@total_quantity = @order_items.collect{|order_item| order_item.quantity }.sum

  	
  end
end
