Rails.application.routes.draw do
  get '/login' => 'oauth#oauth'
  get 'oauth/callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
