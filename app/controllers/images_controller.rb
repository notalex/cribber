class ImagesController < ApplicationController
  before_filter :get_client, only: [:purge]

  def purge
    Image.all.each do |image|
      if Tweet.find_by_user_screen_name(image.screen_name)
        user = @client.show(image.screen_name)
        image.update_attributes! tweet_img: open(user['profile_image_url'])
      else
        image.destroy
      end
    end
    redirect_to tweets_path
  end
end
