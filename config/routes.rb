SampleApp::Application.routes.draw do
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  # Static Pages
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
end
