class OrderItemsController < ApplicationController
	skip_after_action :verify_authorized
	before_action :authenticate_user!

	def create
		@order = current_order
		@order_item = @order.order_items.new(order_params)
		@order.user = current_user
		@order.save!
		session[:order_id] = @order.id
	end

	def destroy
		@order = current_order
		@order_item = @order.order_items.find(params[:id])	
		@order_item.destroy
		@order_items = current_order.order_items
	end





	private
		def order_params
			params.require(:order_item).permit(:ticket_id, :quantity)
		end
end