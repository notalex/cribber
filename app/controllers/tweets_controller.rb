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
      save_image(timeline)
      tweet.store(timeline)
      tweet.save
    end
  end

  def save_image(tweet)
    if tweet['retweeted_status']
      user = tweet['retweeted_status']['user']
    else
      user = tweet['user']
    end
    unless Image.find_by_twitter_id(user['id_str'])
      image = Image.new(twitter_id: user['id_str'], tweet_img: open(tweet['user']['profile_image_url']))
      image.save!
    end
  end

end
