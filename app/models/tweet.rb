class Tweet < ActiveRecord::Base
  belongs_to :user
  has_attached_file :user_img, styles: {tiny: '35x35>'}
        
  def store(tweet)
    if tweet['retweeted_status']
      self.user_name = tweet['retweeted_status']['user']['name']
      self.user_screen_name = tweet['retweeted_status']['user']['screen_name']
      self.twitter_id = tweet['retweeted_status']['user']['id_str']
      self.retweeter_name = tweet['user']['name']
      self.retweeter_screen_name = tweet['user']['screen_name']

    else
      self.user_name = tweet['user']['name']
      self.user_screen_name = tweet['user']['screen_name']
      self.twitter_id = tweet['user']['id_str']
    end

    self.tweet_id = tweet['id_str']
    self.text = tweet['text']
    self.created_at = tweet['created_at']
  end

  def is_retweeted?
    self.retweeter_name?
  end

end
