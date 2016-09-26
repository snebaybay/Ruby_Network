class FriendshipsController < ApplicationController


  def index
    @user = User.find(session[:user_id])
    @friends = @user.friends
    @user_all = User.all 
    @friendship_all = Friendship.all 
    @invites = Friendship.where(friend_id:session[:user_id], status: "Pending")
    @accept = Friendship.where(friend_id:session[:user_id], status: "Accepted")
  end

  def create
    Friendship.create(user: User.find(session[:user_id]), friend: User.find(params[:user_id]), status:"Pending")
    redirect_to '/professional_profile'
  end

  def accept #inverse connection - you need to add all
    @user = User.find(session[:user_id])
    Friendship.find_by(id: params[:id]).update(status:"Accepted")
    Friendship.create(user: @user , friend: User.find(params[:user_id]), status:"Accepted")
    redirect_to '/professional_profile'
  end 

  def destroy #inverse connection - you need to delete both 
   Friendship.find_by(user_id: User.find(session[:user_id]), friend_id: User.find(params[:user_id])).destroy 
   Friendship.find_by(user_id: User.find(params[:user_id]), friend_id:User.find(session[:user_id])).destroy 
   redirect_to '/professional_profile'
  end

end

