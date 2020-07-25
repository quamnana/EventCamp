class Admin::CommentsController < Admin::ApplicationController
	before_action :set_event
	def show
	end




	private
		def set_event
			@event = Event.friendly.find(params[:id])
		end
		
end

