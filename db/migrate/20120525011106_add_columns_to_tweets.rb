class AddColumnsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :twitter_id, :string

    add_column :tweets, :retweeter_id, :string

    add_column :tweets, :retweeted, :boolean, default: false

    add_column :tweets, :favorited, :boolean, default: false

  end
end
