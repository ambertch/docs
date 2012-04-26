class SupervisorDocumentsApproval < ApplicationController
  before_filter :must_be_supervisor
  before_filter :load_doc
  
  # approve
  def create
    @doc.touch_it(current_user)
    @doc.status = Doc::WAITING_FOR_APPROVAL
    @doc.save!
    flash[:info] = "document approved"
    redirect_back
  end
  
  # reject
  def destroy
    @doc.touch_it(current_user)
    @doc.status = Doc::IN_PROGRESS
    @doc.save!
    flash[:info] = "document rejected"
    redirect_back
  end

  private
  def load_doc
    @doc = Doc.find(params[:id])
  end
  
  def must_be_supervisor
    redirect_back if current_user.role != User::SUPERVISOR
  end
end
