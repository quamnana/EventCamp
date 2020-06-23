class RegistrationsController < Devise::RegistrationsController




	private
		def sign_up_params
			params.require(:user).permit(:first_name, :last_name, :username, :organisation_name, :email, :password, :password_confirmation)
		end

		def after_sign_up_path_for(resource)
			"/events"
		end

		def after_inactive_sign_up_path_for(resource)
			"/events"
		end
end