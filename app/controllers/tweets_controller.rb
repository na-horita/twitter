class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
  def new
    @tweet = Tweet.new # 新規投稿用の空のインスタンス
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

end