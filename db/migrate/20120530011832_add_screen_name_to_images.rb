class AddScreenNameToImages < ActiveRecord::Migration
  def change
    add_column :images, :screen_name, :string

  end
end
