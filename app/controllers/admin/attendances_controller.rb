class Admin::AttendancesController < Admin::ApplicationController
	before_action :set_event
	before_action :authenticate_user!
	#skip_after_action :verify_authorized
	
	def show
		@attendees = @event.attendees.paginate(page: params[:page], per_page: 10)
		@coupons = @event.coupons.paginate(page: params[:page], per_page: 10)
	end





	private
		def set_event
			@event = Event.friendly.find(params[:id])
		end

end