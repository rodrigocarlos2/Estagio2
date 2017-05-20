Rails.application.routes.draw do
  resources :answers
  resources :resquest_types
  resources :image_reports
  resources :question_resquest_criminals
  #resources :questions

  get 'reports/index', to: 'reports#index', as: :reports_index

  # Requisição e laudo
  resources :resquest_criminals do 
    resources :reports
    resources :questions
  end

  get 'reports/all', to: 'reports#general', as: :reports
  resources :districts
  resources :group_permissions
  resources :user_permissions
  resources :segments
  resources :user_groups
  resources :permissions

  get 'auditor/index'
  get 'auditor/show/:id', to: 'auditor#show', as: :show_auditor
  get 'images_for_report/index'
  get 'users/change_approved/:id', to: 'users#change_approved', as: :change_approved

  resources :people
  devise_for :users

  scope "/administrador" do
    resources :users
  end

  root to: 'home#index'
  get '/about', to: 'home#about', as: :about
  get '/contact', to: 'home#contact', as: :contact
  get '/dashboard', to: 'home#index', as: :dashboard

end
