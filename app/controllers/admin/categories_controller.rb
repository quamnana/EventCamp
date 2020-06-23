class Admin::CategoriesController < Admin::ApplicationController
	before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@categories = Category.all	
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "Category was created succesfully!"
			redirect_to admin_categories_path
		else
			flash.now[:alert] = "Category was not created!"
			render "new"
		end
	end

	def edit
		
	end

	def update
		
		if @category.update(category_params)
			flash[:notice] = "Category has been updated!"
			redirect_to admin_categories_path
		else
			flash.now[:alert] = "Category was not updated"
			render "edit"
		end
	end

	def destroy
		@category.destroy
		flash[:alert] = "Category has been deleted!"
		redirect_to admin_categories_path
	end



	private
		def category_params
			params.require(:category).permit(:name, :summary)
		end

		def set_category
			@category = Category.friendly.find(params[:id])
		end
end
