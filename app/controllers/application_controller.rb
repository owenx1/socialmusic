class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :username)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :avatar, :about, :email, :password, :current_password)}
          end

           def admin_restricted
    			if !(user_signed_in? && current_user.has_role?(:admin))
      				redirect_to root_path
  				end
  			end
  			helper_method :admin_restricted

end
