class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :twitter_id

      t.timestamps
    end
  end
end
