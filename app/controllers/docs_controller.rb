class DocsController < ApplicationController
  before_filter :only_team_members_or_admin_can_access_doc, :only => [:show, :edit]

  def index
    @team = current_user.team
    @docs = @team.docs
  end

  # displays values, but not ability to edit (meant for supervisor/admin approval/rejection)
  def show
  end
  
  # actual editing page (save/cancel/finish)
  def edit
  end
   
  private
  def only_team_members_or_admin_can_access_doc
    @doc = Doc.find(params[:id])
    @doc.team_id == current_user.team_id || current_user.is_admin?
  end
     
end