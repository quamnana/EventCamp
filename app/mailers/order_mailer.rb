class OrderMailer < ApplicationMailer
	def order_email
		@order = params[:order]
		@order_items = @order.order_items
		@event = @order_items.last.ticket.event

		make_bootstrap_mail(to: @order.user.email, subject: "Thanks for purchasing ticket")
	end
end
