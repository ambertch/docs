class Admin::AllDocsController < ApplicationController
  def show
    # need pagination, of course
    @docs = Doc.all
    render 'docs/index'
  end
end