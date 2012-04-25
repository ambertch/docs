class Admin::SupervisorsController < ApplicationController
  before_filter :require_admin

  def new
    @supervisor = User.new(:role => User::SUPERVISOR, :team_id => params[:team_id])
  end
  
  def create
    @supervisor = User.new(params[:user].merge(:password => 'password'))
    if @supervisor.save
      flash[:success] = 'Supervisor successfully created'
      redirect_to admin_teams_path
    else
      flash[:error] = "Could not save!"
      render :new
    end
  end

end