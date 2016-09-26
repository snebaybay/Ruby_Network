class UsersController < ApplicationController
  def index
  end

  def register
  	if !session[:user_id]
	  	@user = User.create(name:params[:name],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation], description:params[:description])
	  	if @user.valid?
	  		session[:user_id] = @user.id
	  		redirect_to '/professional_profile'
	  	else
	  		redirect_to '/users', :notice => @user.errors.full_messages
	  	end
	  end 
  end

  def login
  		if !params[:email].blank? && !params[:password].blank?
  		user = User.find_by_email(params[:email])
	  	if user 
	  		if  user.authenticate(params[:password])
	  			session[:user_id] = user.id
	  			redirect_to '/professional_profile'
	  		else 
	  			redirect_to '/users', :alert =>  "Email/password do not match. Try again."
	  		end
	  	else
	  		redirect_to '/users', :alert =>  "Email does not exist."
	  	end
	  else
	  	redirect_to '/users', :alert =>  "Email and Password cannot be blank."
	  end
  end

   def show_all
    @users = User.all 
    @current_user = User.find(session[:user_id])
    @friendship = Friendship.all 
  end

  def show
  @user= User.find(params[:user_id])
  @network = User.where("id NOT IN(?)", User.third.friends.select("id"))
 
  end 

  def logout
    session[:user_id] = nil
    redirect_to '/users'
  end 

end
