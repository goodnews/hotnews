class AddVoteCountToMicropost < ActiveRecord::Migration
  def self.up
    add_column :microposts, :votes_count, :integer
  end

  def self.down
    remove_column :microposts, :votes_count
  end
end
