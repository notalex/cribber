class AddAttachmentUserImgToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :user_img_file_name, :string
    add_column :tweets, :user_img_content_type, :string
    add_column :tweets, :user_img_file_size, :integer
    add_column :tweets, :user_img_updated_at, :datetime
  end

  def self.down
    remove_column :tweets, :user_img_file_name
    remove_column :tweets, :user_img_content_type
    remove_column :tweets, :user_img_file_size
    remove_column :tweets, :user_img_updated_at
  end
end
