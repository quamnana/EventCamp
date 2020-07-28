class OrdersController < ApplicationController
	before_action :set_order, only: [:show]
	before_action :authenticate_user!
	

	def show
		authorize @order
		@order_items = @order.order_items 
		
		@order_items.each do |order_item|
			@ticket = order_item.ticket

			order_item.coupons.each do |coupon|
				@code = coupon.code
				@qrcode = RQRCode::QRCode.new(@code)

				@svg = @qrcode.as_svg(
					offset: 0,
					color: "000",
					shape_rendering: "cripEdges",
					module_size: 3
				)
			end
		end	
	end



	private
		def set_order
			@order = Order.find(params[:id])
		end
end