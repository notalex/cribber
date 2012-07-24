class Tweet < ActiveRecord::Base
  belongs_to :user
  has_attached_file :user_img, styles: {tiny: '35x35>'}
end
