class Admin::DocsController < ApplicationController

  # page where an admin drops stuff in / removes docs
  def show
  end
  
  # add documents to a team's work queue
  def create
    team = Team.find(params[:docs][:team_id])    
    if team && !params[:docs][:case_keys].blank?
      success_message, failure_message = team.add_docs_from_comma_seperated(params[:docs][:case_keys])
      flash[:success] = success_message
      flash[:error] = failure_message      
    else
      flash[:error] = "There was an error"
    end
    redirect_back
  end
  
  # remove documents from any teams' work queues
  def destroy
    flash[:error] = "This feature has not been implemented"
    redirect_back
  end
end