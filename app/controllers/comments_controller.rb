class CommentsController < ApplicationController
	before_action :set_event
	before_action :authenticate_user!
	#skip_after_action :verify_authorized


	def create
		@comment = @event.comments.build(comment_params)
		@comment.author = current_user
		authorize @comment, :create?

		if @comment.save
			flash[:notice] = "Comment was added to event successfully!"
			redirect_to event_path(@comment.event)
		else
			flash[:alert] = "Comment was not added!"
			redirect_to event_path(@comment.event)
		end
	end








	private
		def set_event
			@event = Event.friendly.find(params[:event_id])
		end

		def comment_params
			params.require(:comment).permit(:body)
		end

end
