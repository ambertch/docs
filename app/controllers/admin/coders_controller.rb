class Admin::CodersController < ApplicationController
  before_filter :require_admin_or_supervisor
  
  def new
    @coder = User.new(:role => User::CODER, :team_id => params[:team_id])
  end
  
  def create
    @coder = User.new(params[:user].merge(:password => 'password'))
    if @coder.save
      flash[:success] = 'Coder successfully created'
      case current_user.role 
        when User::ADMIN
          redirect_to admin_teams_path
        when User::SUPERVISOR
          redirect_to teams_path
      end        
    else
      flash[:error] = "Could not save! #{@coder.errors.full_messages.join(', ')}"
      render :new
    end    
  end
  
end