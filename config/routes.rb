Lithub::Application.routes.draw do
  devise_for :users
  
  root :to => "login#show"
  resource :login
  
  namespace :admin do
    resource :teams # an admin manages teams
    resource :docs # an admin can drop in and remove docs
    resource :all_docs # view all teams' documents
    resources :supervisors # an admin manages supervisors
    resources :coders # an admin or supervisor manages coders    
  end
  
  resource :teams # where a supervisor manages his coders  
  resource :my_works # for a supervisor or admin to manage acceptances/approvals and address questions (flagged docs)
  resources :docs # the document view, and document list for a given team  
  resource :document_codings # view where handcoding work is done

  resource :supervisor_document_approval # create = approve, destroy = reject
  resource :admin_document_acceptance # create = accept, destroy = reject

end
