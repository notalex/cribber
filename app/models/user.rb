class User < ActiveRecord::Base
  has_one :tweeter
end
