class OrdersController < ApplicationController
	before_action :authenticate_user!
	skip_after_action :verify_authorized
	

	def show
		@order = Order.find(params[:id])
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
end