class DocsController < ApplicationController
  before_filter :only_team_members_or_admin_can_access_doc, :only => [:show, :edit]
  before_filter :load_doc, :only => [:show, :edit]
  before_filter :load_doc_by_doc_id, :only => [:unlock]
  before_filter :only_supervisor_or_admin_can_unlock, :only => [:unlock]

  def index
    @team = current_user.team
    @table_docs = DocTablePresenter.present(@team.docs)
  end

  # displays values, but not ability to edit (meant for supervisor/admin approval/rejection)
  def show
  end
  
  # actual editing page (save/cancel/finish)
  def edit
    if !@doc.locked_by_user || @doc.locked_by_user == current_user
      @doc.touch_it(current_user)
      @doc.lock(current_user)
      flash[:info] = "You've locked this document for editing"
    else
      flash[:error] = "This document was locked by #{@doc.locked_by_user.name}"
      redirect_back
    end 
  end
   
  def unlock
    @doc.unlock
    flash[:info] = "document was unlocked"
    redirect_back
  end
  
  def popup
    render :layout => false
  end
  
  private
  def only_team_members_or_admin_can_access_doc
    @doc = Doc.find(params[:id])
    @doc.team_id == current_user.team_id || current_user.is_admin?
  end
   
  def only_supervisor_or_admin_can_unlock
    redirect_back if (current_user.role != User::ADMIN && current_user.role != User::SUPERVISOR)
  end
  
  def load_doc_by_doc_id
    @doc = Doc.find(params[:doc_id])
  end
  
  def load_doc
    @doc = Doc.find(params[:id])
  end       
end