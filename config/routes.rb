Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/usuarios', to: 'usuarios#get_all_usuarios'

  post '/login', to: 'usuarios#login'

  get '/getAllTweets', to: 'tweets#get_all_tweets'

  get '/tweets/:username', to: 'tweets#get_tweets_by_username'

  post '/registrarUsuario', to: 'usuarios#registrar_usuario'

  post '/addTweet', to: 'tweets#add_tweet'

end
