class EventsController < ApplicationController
	
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	#before_action :authorize_owner!, only: [:edit, :update, :destroy]
	def index
		if params[:query].present?
			@events = Event.search(params[:query])
		else
			@events = Event.order(start_date: :asc).paginate(page: params[:page], per_page: 5)
		end
		#@events = Event.order(start_date: :desc)
		@categories = Category.order(:name)
		authorize @events, :index?
	end

	def show
		authorize @event, :show?
		@comment = Comment.new
		@comment.event_id = @event.id
		@order_item = current_order.order_items.new
		
	end

	
	def new
		@event = Event.new

		authorize @event, :new?
	end

	def create
		@event = Event.new(event_params)
		@event.organizer = current_user
	
		authorize @event, :create?
		
		if @event.save
			flash[:notice] = "Event was created succesfully"
			redirect_to @event
		else
			flash.now[:alert] = "Event was not created!"
			render "new"
		end
	end

	
	def edit
		authorize @event, :edit?
	end

	def update
		authorize @event, :update?


		if @event.update(event_params)
			flash[:notice] = "Event was updated succesfully!"
			redirect_to @event
		else
			flash.now[:alert] = "Event was not updated!"
			render "edit"
		end
	end

	
	def destroy
		authorize @event, :destroy?
		@event.destroy
		flash[:alert] = "Event is deleted"
		redirect_to events_path
	end





	private

		def set_event
			@event = Event.friendly.find(params[:id])
		
		rescue ActiveRecord::RecordNotFound 
			flash[:alert] = "The page you requested does not exist"
			redirect_to events_path
		end
		

		def event_params
			params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location, :image, :seats, :category_id, :tag_list, tickets_attributes: [:id, :name, :price, :sku, :_destroy])
		end

		#def authorize_owner!
			#authenticate_user!

			#unless @event.organizer == current_user
				#flash[:alert] = "You dont have permission to '#{action_name}' the event #{@event.title.upcase }"
				#redirect_to events_path
			#end
		#end
end
