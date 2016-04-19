module ApplicationHelper

  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    session[:user_id]
  end

  def is_admin?
    current_user.admin_status == true
  end

end
