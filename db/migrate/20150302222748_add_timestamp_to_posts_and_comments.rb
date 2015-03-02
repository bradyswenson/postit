class AddTimestampToPostsAndComments < ActiveRecord::Migration
  def change
    add_column :posts, :created_at, :datetime
    add_column :posts, :updated_at, :datetime
    add_column :comments, :created_at, :datetime
    add_column :comments, :updated_at, :datetime
  end
end
