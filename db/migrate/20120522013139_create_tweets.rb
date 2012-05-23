class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.integer :retweet_count
      t.string :user_name
      t.string :user_screen_name
      t.string :retweeter_name
      t.string :retweeter_screen_name
      t.string :text

      t.timestamps
    end
  end
end
