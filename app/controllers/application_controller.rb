class ApplicationController < ActionController::Base
	include Pundit
	
	after_action :verify_authorized, unless: :devise_controller?
	before_action :configure_permitted_parameters, if: :devise_controller?
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	


	

	private
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up) do |user|
				user.permit(:first_name, :last_name, :username, :organisation_name, :email, :password, :password_confirmation)
			end
			devise_parameter_sanitizer.permit(:account_update) do |user|
				user.permit(:first_name, :last_name, :username, :organisation_name, :email, :password, :current_password, :password_confirmation)
			end
		end

		def user_not_authorized
			flash[:alert] = "You are not authorized to perform that action"
			redirect_to (request.referrer || root_path)
		end

		def after_sign_in_path_for(resource)
			"/events"
		end

end