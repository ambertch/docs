class Admin::TeamsController < ApplicationController
  before_filter :must_be_admin

  def show
    @teams = Team.all
  end  
  
  def new
    @team = Team.new(:name => "")
  end
  
  def create
    @team = Team.new(params[:team])
    if @team.save
      flash[:success] = 'Team successfully created'
      redirect_to admin_teams_path
    else
      flash[:error] = "Could not save! #{@team.errors.full_messages.join(', ')}"
      render :new
    end
  end
  
  private  
  def must_be_admin
    redirect_back if current_user.role != User::ADMIN
  end
end