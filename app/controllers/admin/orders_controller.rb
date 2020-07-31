class Admin::OrdersController < Admin::ApplicationController
	def index
		@orders = Order.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
	end

	def show
		@order = Order.find(params[:id])
		@order_items = @order.order_items
	end
end