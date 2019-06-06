class AddRankingCountToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :rankings_count, :integer
  end
end
