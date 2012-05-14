class AddSaltAndIsAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
    add_column :users, :is_admin, :boolean, default: false

  end
end
