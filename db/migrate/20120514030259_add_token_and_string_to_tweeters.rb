class AddTokenAndStringToTweeters < ActiveRecord::Migration
  def change
    add_column :tweeters, :token, :string

    add_column :tweeters, :secret, :string

  end
end
