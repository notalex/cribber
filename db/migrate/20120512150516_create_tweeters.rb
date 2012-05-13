class CreateTweeters < ActiveRecord::Migration
  def change
    create_table :tweeters do |t|
     t.string :consumer_key
     t.string :consumer_secret
     t.string :oauth_token
     t.string :oauth_verifier
     t.references :user

     t.timestamps
    end
  end
end
