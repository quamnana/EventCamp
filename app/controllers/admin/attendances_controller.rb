class Admin::AttendancesController < Admin::ApplicationController
	before_action :set_event
	before_action :authenticate_user!
	#skip_after_action :verify_authorized
	
	def show
		@free_attendees = @event.attendees.paginate(page: params[:page], per_page: 10)
		@paid_attendees = @event.coupons.paginate(page: params[:page], per_page: 10)

		@total_sales = @event.coupons.collect{|coupon| coupon.ticket.price}.sum
	end





	private
		def set_event
			@event = Event.friendly.find(params[:id])
		end

end