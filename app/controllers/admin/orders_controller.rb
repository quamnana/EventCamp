class Admin::OrdersController < Admin::ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order_item = @order.order_items
	end
end