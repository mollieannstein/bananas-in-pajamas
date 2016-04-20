class AdminController < ApplicationController
before_filter :authorize, :is_admin?

  def show
    @user = User.find(params[:id])
  end

  def is_admin?
    if is_admin?
      true
    else
      render :text => 'Who are you to doing this? :)'
    end
  end

end

