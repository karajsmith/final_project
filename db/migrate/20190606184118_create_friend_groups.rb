class CreateFriendGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_groups do |t|
      t.integer :friend_request_id
      t.string :name
      t.integer :destination_id

      t.timestamps
    end
  end
end
