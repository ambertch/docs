class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :store_return_location
  
  def store_return_location
    session[:return_to] = request.referer
  end
  
  def return_location
    session[:return_to]
  end
  
  def redirect_back
    redirect_to session[:return_to]
  end
  
  def require_admin
    if current_user.role == User::ADMIN
      return true
    else
      redirect_back
    end
  end
  
  def require_admin_or_supervisor
    if current_user.role == User::SUPERVISOR || current_user.role == User::ADMIN
      return true
    else
      redirect_back
    end
  end
end
