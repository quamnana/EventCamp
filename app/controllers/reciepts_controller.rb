class RecieptsController < ApplicationController
	before_action :authenticate_user!

	def show
		@order = Order.find(params[:id])
		@order_items = @order.order_items
		@event = @order_items.last.ticket.event

		authorize @order
	end
end