class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :twitter_id
      t.string :crypted_password
      t.string :email

      t.timestamps
    end
  end
end
