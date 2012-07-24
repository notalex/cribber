class TweetsController < ApplicationController
  include TweetConfig

  before_filter :confirm_twitter_credentials, only: [:tweets]
  before_filter :get_client, only: [:tweets, :retweet, :post_tweet, :destroy]
  before_filter :load_tweet, only: [:destroy]

  def tweets
    timelines = @client.home_timeline(count: TweetConfig.count)
    timelines.each { |timeline| Image.save_tweet_images(timeline) }
    @tweets = TweetFactory.create_structs(timelines)
    @user_name = @client.info["screen_name"]
  end

  def destroy_all_tweets
    current_user.tweets.each{|tweet| tweet.destroy }
    redirect_to tweets_path
  end

  def retweet
    @client.retweet(params[:id])
    render nothing: true
  end

  def destroy
    @client.status_destroy(@tweet.tweet_id)
    @tweet.destroy
    redirect_to tweets_path
  end

  def post_tweet
    @client.update(params[:send_tweet])
    redirect_to tweets_path
  end

#######
private

  def load_tweet
    @tweet = Tweet.find(params[:id])
  end

end
