class UsersController < ApplicationController
    before_action :signed_in_user, only: [:edit, :update]
    before_action :correct_user,   only: [:edit, :update]


  def new
  	    @user = User.new
  end
  def index
    @users = User.all
  end
  def show
        @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
     flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end 
    def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end 
    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    # Before filters
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    def correct_user
      @user = User.find(params[:id])
      flash[:notice] = "You Can Only Edit Your Own Information... You Tryin' to Hack Me Bro? We're Just a bunch of friendly Dees!"
      flash[:success] = "IP Successfully Added to Suspect Hacker List (but not really)"
      redirect_to(root_url) unless current_user?(@user)
    end
end
