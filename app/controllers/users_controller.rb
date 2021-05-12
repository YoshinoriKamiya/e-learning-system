class UsersController < ApplicationController
  before_action :only_loggedin_users, only: [:index,:edit,:update]
  before_action :correct_user, only: [:edit, :update]
 

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 8)
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
   end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Saved successfully"
      redirect_to login_url
    else
      flash[:danger] = "Invaild content. Try again"
      render 'new'
    end
  end
  
def show
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:success] = "Saved succesfully!"
    redirect_to @user
  else
    flash[:danger] = "Invalid content. Try again"
    render 'edit'
  end
end
end

def destroy
  User.find(params[:id]).destroy
  redirect_to users_url
end

def following
  @title = "Following"
  @user = User.find(params[:id])
  @users = @user.followed_users.paginate(page: params[:page], per_page: 5)
  @all_users = @user.followed_users
  render 'show_follow'
end 

def followed_users
  @title = "Followers"
  @user = User.find(params[:id])
  @users = @user.followers.paginate(page: params[:page], per_page: 5)
  @all_users = @user.followers
  render 'show_follow'
end

private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
    def only_loggedin_users
       redirect_to login_url unless logged_in?
     end
   
     def correct_user
       @user = User.find(params[:id])
       redirect_to(roo_url) unless current_user?(@user)
     end