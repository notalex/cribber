class TweetsController < ApplicationController
  before_filter :set_request_token, only: [:tweets]
  include TweetConfig

  def tweets
    tweets = TwitterOAuth::Client.new(
      :consumer_key => admin.tweeter.consumer_key,
      :consumer_secret => admin.tweeter.consumer_secret,
      :token => current_user.tweeter.token, 
      :secret => current_user.tweeter.secret
    )
    tweets.home_timeline(count: TweetConfig.count).each do |timeline|
      next if  Tweet.find_by_tweet_id(timeline['id_str'])
      tweet = current_user.tweets.new
      tweet.store(timeline)
      tweet.save
    end
  end

end
