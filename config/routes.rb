App::Application.routes.draw do
  
  get '/me' => "sessions#bla"
  
  resource :session  
  match '/auth/:provider/callback', to: 'sessions#create'
end
