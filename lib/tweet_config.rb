module TweetConfig
  def self.count
    if Rails.env.production?
      200
    else
      25
    end
  end
end
