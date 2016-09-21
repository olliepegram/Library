Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :books do
    resources :comments
  end
  resources :books
  devise_for :users
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
