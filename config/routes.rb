Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#landing'
  get '/refresh', controller: 'application', action: 'refresh_data'
end
