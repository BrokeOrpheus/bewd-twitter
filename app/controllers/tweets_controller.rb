class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def create

    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)
    

    if session
      user = session.user
      @tweet = Tweet.new(message: params[:tweet][:message], user: user)

      render json: {
        tweet: {
          username: user.username,
          message: @tweet.message
        }
      }
    end
  end

  def index_by_user
    user = User.find_by(username: params[:username])
    @tweets = user.tweets
    render 'tweets/index'
  end

  def destroy
    tweet = Tweet.find_by(id = params[:id])

    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    if session && tweet.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end
end
