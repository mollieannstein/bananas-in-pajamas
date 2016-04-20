class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      @errors = user.errors.full_messages
      render '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(admin_status: params[:admin_status])
    redirect_to '/users'
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to '/users'
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
