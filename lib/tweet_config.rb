module TweetConfig
  def self.count
    if Rails.env.production?
      100
    else
      5
    end
  end
end
