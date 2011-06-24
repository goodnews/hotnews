class AddIndexesToUsers < ActiveRecord::Migration
  def self.up
    add_index :users, :name
    add_index :users, :email
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :microposts, :user_id
  end

  def self.down
    remove_index :users, :username
    remove_index :users, :email
    remove_index :relationships, :follower_id
    remove_index :relationships, :followed_id
    remove_index :microposts, :user_id
  end
end
