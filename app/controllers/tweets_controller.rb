class TweetsController < ApplicationController
  include TweetConfig

  before_filter :confirm_twitter_credentials, only: [:tweets]
  before_filter :get_client, only: [:tweets, :retweet, :post_tweet]
  before_filter :load_tweet, only: [:destroy]

  def tweets
    @client.home_timeline(count: TweetConfig.count).each do |timeline|
      next if Tweet.find_by_tweet_id(timeline['id_str'])
      Image.save_tweet_images(timeline)
      tweet = current_user.tweets.new
      tweet.store(timeline)
      tweet.save
    end
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
