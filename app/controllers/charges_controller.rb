class ChargesController < ApplicationController
	skip_after_action :verify_authorized
	before_action :authenticate_user!
	after_action :set_coupon, only: [:create]
	after_action :set_attendance, only: [:create]

	def new
		
	end


	def create
		@order = current_order
		@order_items = @order.order_items
		@amount = @order.subtotal_in_cents
		@event = @order_items.last.ticket.event
		
		
		customer = Stripe::Customer.create({
			email: params['stripeEmail'],
			source: params['stripeToken']
		})

		charge = Stripe::Charge.create({
			customer: customer.id,
			amount: @amount,
			description: "Event Payment",
			currency: 'usd'
		})


		flash[:notice] = "Hooray! Your ticket purchase was successful.. "
		redirect_to events_path
		

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end



	private
		# @order_items is in an array form so an iteration has to be done
		#in order to get each ticket in each order_item so that coupons can 
		#be generated for those tickets 
		def set_coupon
			@order_items.each do |order_item|
				@ticket = order_item.ticket
				@quantity = order_item.quantity
				
				@quantity.times do
					@ticket.coupons.create!
				end
			end
		end

		def set_attendance
			@attendance = @event.attendances.where(attendee: current_user).create
		end

end