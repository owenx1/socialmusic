module ApplicationHelper

	def has_role?(role)
		current_user && current_user.has_role?(role)
	end

	def user_restricted
        if (user_signed_in? == false)
            controller.redirect_to new_user_session_path
        end
    end
end
