class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = ["Invalid login credentials"]
      render '/sessions/new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

end
