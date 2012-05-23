class User < ActiveRecord::Base
  has_one :tweeter, dependent: :destroy
  has_many :tweets, dependent: :destroy
  attr_accessor :password

  validates :name, uniqueness: {case_sensitive: false}, presence: true
  before_save :encrypt_new_password
  before_save :first_user_is_admin
  after_create :spawn_tweeter

  def confirm_password?(string)
    crypted_password == encrypt(string)
  end

private
  def first_user_is_admin
    self.is_admin = true unless User.find_by_is_admin(true)
  end

  def password_present?
    password.present? 
  end

  def encrypt_new_password
    return if password.blank?
    self.salt = SecureRandom.base64(8)
    self.crypted_password = encrypt(password)
  end

  def encrypt(string)
    Digest::SHA2.hexdigest(string + self.salt)
  end

  def spawn_tweeter
    self.create_tweeter!
  end
end
