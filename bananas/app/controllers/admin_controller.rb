class AdminController < ApplicationController
before_filter :authorize, :admin_check?
include ApplicationHelper

  def show
    @user = User.find(params[:id])
  end

  def admin_check?
    if is_admin?
      true
    else
      render :text => 'Who are you to doing this? :)'
    end

  end

end

