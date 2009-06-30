class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :post_users, :post_id
    add_index :post_users, :user_id
    add_index :post_views, :post_id
    add_index :post_views, :user_id
  end

  def self.down
  end
end
