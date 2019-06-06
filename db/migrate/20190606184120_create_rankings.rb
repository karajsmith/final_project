class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.integer :user_id
      t.integer :destination_id
      t.integer :rankings

      t.timestamps
    end
  end
end
