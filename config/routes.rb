Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :klasses
  get 'new_klass', to: 'klasses#new'
end
