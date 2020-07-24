class AttendancesController < ApplicationController
	before_action :set_event
	before_action :authenticate_user!
	skip_after_action :verify_authorized
	
	def show
	end





	private
		def set_event
			@event = Event.friendly.find(params[:event_id])
		end
end