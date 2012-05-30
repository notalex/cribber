class Image < ActiveRecord::Base
  has_attached_file :tweet_img, styles: {tiny: '35x35>'}

  def self.save_tweet_images(tweet)
    if tweet['retweeted_status']
      user = tweet['retweeted_status']['user']
    else
      user = tweet['user']
    end
    unless Image.find_by_twitter_id(user['id_str'])
      image = Image.new(twitter_id: user['id_str'], tweet_img: open(user['profile_image_url']), screen_name: user['screen_name'])
      image.save!
    end
  end
end
