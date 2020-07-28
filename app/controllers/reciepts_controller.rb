class RecieptsController < ApplicationController
	before_action :authenticate_user!

	def show
		
		@order = Order.find(params[:id])
		@event = Event.friendly.find(params[:id])
		authorize @order
	end
end