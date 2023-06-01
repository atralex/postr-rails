class TweetsController < ApplicationController
  def get_all_tweets
    tweets = Tweet.all
    render json: tweets
  end

  def get_tweets_by_username
    usuario = Usuario.find_by(username: params[:username])

    if usuario
      tweets = Tweet.where(user_id: usuario.id)
      render json: tweets
    else
      render json: { message: 'Usuario no encontrado' }, status: :not_found
    end
  end

  def add_tweet
    username = params[:username]
    content = params[:content]

    usuario = Usuario.find_by(username: username)

    if usuario
      tweet = Tweet.create(user_id: usuario.id, content: content)
      render json: tweet, status: :created
    else
      render json: { error: 'El usuario no existe' }, status: :unprocessable_entity
    end
  end
end
