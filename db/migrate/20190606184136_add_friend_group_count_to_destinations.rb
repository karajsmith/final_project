class AddFriendGroupCountToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :friend_groups_count, :integer
  end
end
