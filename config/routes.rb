Bloccit::Application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, only: [:comment], except: [:index]
  end

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
