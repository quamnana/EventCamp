class CartsController < ApplicationController
	skip_after_action :verify_authorized

  def show
  	@order_items = current_order.order_items
  	@event = Event.friendly.find(params[:id])
  end
end
