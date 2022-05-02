Rails.application.routes.draw do

   devise_for :users
  root to: "homes#top"
  get 'home/about' => "homes#about"
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  resources :users do
    member do
      get :followingm, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
