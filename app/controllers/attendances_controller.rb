class AttendancesController < ApplicationController
	before_action :set_event
	before_action :authenticate_user!
	skip_after_action :verify_authorized
	
	def show

		respond_to do |format|
			format.html
			format.pdf do
				render pdf: "#{@event.title} - Attendance List",
					   template: "attendances/show.html.erb",
					   layout: "pdf_layout.html",
					   page: "A4",
					   encoding: "UTF-8"
			end
		end
		
	end

	def create
		@attendance = @event.attendances.where(attendee: current_user).first_or_create

		if @attendance.save
			flash[:notice] = "You have successfully registered to attend this event"
			redirect_to user_path(current_user)
		end
	end




	private
		def set_event
			@event = Event.friendly.find(params[:event_id])
		end
end