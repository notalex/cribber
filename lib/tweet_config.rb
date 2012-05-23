module TweetConfig
  def self.count
    if Rails.env.production?
      100
    else
      25
    end
  end
end
