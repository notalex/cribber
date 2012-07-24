class TweetFactory

  FACTORY = Struct.new(:user_name, :user_screen_name, :twitter_id, :retweeter_name, :retweeter_screen_name, :tweet_id, :text)

  def self.create_structs(timelines)
    timelines.map { |timeline| self.create_struct(timeline) }
  end

  def self.create_struct(tweet)
    struct = FACTORY.new

    if tweet['retweeted_status']
      struct.user_name = tweet['retweeted_status']['user']['name']
      struct.user_screen_name = tweet['retweeted_status']['user']['screen_name']
      struct.twitter_id = tweet['retweeted_status']['user']['id_str']
      struct.retweeter_name = tweet['user']['name']
      struct.retweeter_screen_name = tweet['user']['screen_name']
    else
      struct.user_name = tweet['user']['name']
      struct.user_screen_name = tweet['user']['screen_name']
      struct.twitter_id = tweet['user']['id_str']
    end

    struct.tweet_id = tweet['id_str']
    struct.text = tweet['text']

    struct
  end
    
end
