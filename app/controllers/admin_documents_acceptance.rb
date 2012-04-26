class AdminDocumentsAcceptance < ApplicationController
  before_filter :must_by_admin
  before_filter :load_doc

  # accept
  def create
    @doc.touch_it(current_user)
    @doc.status = Doc::APPROVED
    @doc.save!
    flash[:info] = "document accepted"
    redirect_back
  end
  
  # reject
  def destroy
    @doc.touch_it(current_user)
    @doc.status = Doc::WAITING_FOR_APPROVAL
    @doc.save!
    flash[:info] = "document rejected"
    redirect_back
  end
  
  private
  def load_doc
    @doc = Doc.find(params[:id])
  end

  def must_be_admin
    redirect_back if current_user.role != User::ADMIN
  end
end