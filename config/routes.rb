Rails.application.routes.draw do
  get '/login' => 'oauth#create'
  get '/logout' => 'oauth#destroy'
  get '/oauth/callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
