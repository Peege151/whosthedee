class FriendshipsController < ApplicationController
include SessionsHelper
  def index
    @friends = current_user.friends
  end

  def new
    @users = User.all :conditions => ["id != ?", current_user.id]
  end

  def create
	invitee = User.find(params[:id])
    if current_user.invite invitee
      flash[:success] = "Successfully Requested Buddy!!"
      redirect_to :back
    else
      redirect_to :back, :notice => "Sorry! You can't invite that user!"
    end
  end

  def update
    inviter = User.find(params[:id])
    puts "********"
    if current_user.approve inviter
    puts "*******"
      flash[:success] = "Successfully confirmed friend!"
      redirect_to :back 
    else
      flash[:fail] = "Oops!"
      redirect_to :back
    end
  end

  def requests
    @pending_requests = current_user.pending_invited_by
    @user = User.find(params[:id])
  end

  def invites
    @pending_invites = current_user.pending_invited
  end

  def destroy
    user = User.find_by_id(params[:id])
    if current_user.remove_friendship user
      flash[:success] = "Successfully Delcined Friend!"
      redirect_to :back 
    else
      flash[:fail] = "Oops!"
      redirect_to :back
    end
  end
end
