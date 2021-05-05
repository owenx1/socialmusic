class UsersController < ApplicationController
	def index
  		@users = User.all

  		respond_to do |format|
     	format.html # index.html.erb
     	format.json { render json: @users }
    	end
  	end

  	def show
    	@user = User.find(params[:id])

    	respond_to do |format|
      	format.html # show.html.erb
      	format.json { render json: @users}
    	end
  	end
 
	def myprofile
		if User.find(current_user.id).nil?
			redirect_to "/users/sign_in"
		else
			@user = User.find(current_user.id)
			redirect_to "/users/#{@user.id}"
		end
	end

	def destroy
		if (current_user.has_role?(:admin))
    		@user = User.find(params[:id])
    		@user.destroy
    		redirect_to users_path, notice: 'User deleted.'
    	else
    		redirect_to root_path
    	end
  	end
end





