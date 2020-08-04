class ChargesController < ApplicationController
	skip_after_action :verify_authorized
	before_action :authenticate_user!
	after_action :set_coupon, only: [:create]
	after_action :set_attendance, only: [:create]
	after_action :email_attendee, only: [:create]

	def new
		
	end


	def create
		@order = current_order
		@order_items = @order.order_items
		@amount = @order.subtotal_in_cents
		@event = @order_items.last.ticket.event
		
		# Stripe customer 
		customer = Stripe::Customer.create({
			email: params['stripeEmail'],
			source: params['stripeToken']
		})
		
		# Stripe charge
		charge = Stripe::Charge.create({
			customer: customer.id,
			amount: @amount,
			description: @event.title,
			currency: 'usd'
		})

		# Stripe payment success notification and redirection
		flash[:notice] = "Hooray! Your ticket purchase was successful.. "
		redirect_to reciept_path(@order)
		
		# Stripe error handler
		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_charge_path
	end



	private
		# @order_items is an array so an iteration has to be done
		#in order to get each ticket in each order_item so that coupons can 
		#be generated for those tickets 
		def set_coupon
			@order_items.each do |order_item|
				@ticket = order_item.ticket
				@quantity = order_item.quantity
				
				# Creating coupon instance/object for every ticket's order_item based on their quantity
				@quantity.times do
					@ticket.coupons.where(order_item_id: order_item, user_id: current_user, event_id: @event).create!
				end
			end
		end

		# Create attendee instance/object after payment
		def set_attendance
			@attendance = @event.attendances.where(attendee: current_user).create
		end

		# Send email to the attendee
		def email_attendee
			OrderMailer.with(order: @order).order_email.deliver_later
		end
end