class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def home
  @user = current_user
  end
  def user_params
  end
    @randee = Dog.all.order("RANDOM()").limit(1)[0].image.url

end