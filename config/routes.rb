Lithub::Application.routes.draw do
  devise_for :users
  
  root :to => "login#show"
  resource :login
  
  resource :teams # where a supervisor manages his coders  
  resource :my_works # for a supervisor or admin to manage acceptances/approvals and address questions (flagged docs)
  resources :docs do # the document view, edit, and document list for a given team (goes off current_user.team)
    get 'unlock'
  end
  
  namespace :admin do
    resource :teams # an admin manages teams
    resource :docs # an admin can drop in and remove docs
    # resource :all_docs # view all teams' documents?
    resources :supervisors # an admin manages supervisors
    resources :coders # an admin or supervisor manages coders    
  end
  
  resource :supervisor_documents_approval # create = accept, destroy = reject
  resource :admin_documents_acceptance # create = approve, destroy = reject

end
