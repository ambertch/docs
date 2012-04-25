class LoginController < ApplicationController  
  
  # the idea is that an admin/supervisor is probably more concerned with the team view
  def show
    redirect_to docs_path(current_user.team) if current_user.is_coder?
    redirect_to teams_path(current_user.team) if current_user.is_supervisor?
    redirect_to admin_teams_path if current_user.is_admin?
  end
end