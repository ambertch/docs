class TeamsController < ApplicationController
  before_filter :require_admin_or_supervisor
  
  def show
    @team = current_user.team
  end
  
end