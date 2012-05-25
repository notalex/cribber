class Image < ActiveRecord::Base
  has_attached_file :tweet_img, styles: {tiny: '35x35>'}
end
