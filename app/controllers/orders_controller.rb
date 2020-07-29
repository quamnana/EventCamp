class OrdersController < ApplicationController
	before_action :set_order, only: [:show]
	before_action :authenticate_user!
	

	def show
		authorize @order
		@order_items = @order.order_items 
		
		# Generating QRCode for coupons
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

		# Generating tickets in PDF format
		respond_to do |format|
			format.html
			
			format.pdf do
				render pdf: "EventCamp eTicket - #{@ticket.event.title}",
					   template: "orders/show.html.erb",
					   layout: "pdf_layout.html",
					   page_size: 'A4',
  					   encoding:"UTF-8"
			end
		end
	end



	private
		def set_order
			@order = Order.find(params[:id])
		end
end