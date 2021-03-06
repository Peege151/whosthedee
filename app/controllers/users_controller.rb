class UsersController < ApplicationController
    before_action :signed_in_user, only: [:edit, :update]
    before_action :correct_user,   only: [:edit, :update]
    before_action :admin_user,     only: :destroy
def home
end

  def cities
    @cities = City.all
  end

  def hoods
    @hoods = Hood.all
  end

  def burroughs
    @burroughs =  Burrough.all  
  end

  def new
  	 @user = User.new
  end
   def index
    @users = User.paginate(page: params[:page])
  end
  def show
    @user = User.find(params[:id])
    @dog = Dog.new
    #@userhood = Geocoder.search("#{@user.latitude}, #{@user.longitude}")[0].data["address_components"][2]["long_name"]
    #@userburrough = Geocoder.search("#{@user.latitude}, #{@user.longitude}")[0].data["address_components"][3]["long_name"]
  end
  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Whosthedee?!"
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
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :image, :city_id, :burrough_id, :hood_id, :zip_code, :latitude, :longitude)
    end
    # Before filters
     
    def correct_user
      @user = User.find(params[:id])
      # flash[:notice] = "You Can Only Edit Your Own Information... You Tryin' to Hack Me Bro? We're Just a bunch of friendly Dees!"
      # flash[:success] = "IP Successfully Added to Suspect Hacker List (but not really)"
      redirect_to(root_url) unless current_user?(@user)
    end
      def admin_user
      redirect_to(root_url) unless current_user.admin?
    end 
end
