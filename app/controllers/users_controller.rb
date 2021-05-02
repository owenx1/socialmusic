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
end





