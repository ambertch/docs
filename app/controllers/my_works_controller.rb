class MyWorksController < ApplicationController
  def show
    if current_user.is_admin?
      render "admin_work"
    elsif current_user.is_supervisor?
      render "supervisor_work"
    elsif current_user.is_coder?
      render "coder_work"
    else
      redirect_back
    end
  end
end