class AddTimestampsToPc < ActiveRecord::Migration
  def change
    add_column :post_categories, :created_at, :datetime
    add_column :post_categories, :updated_at, :datetime
  end
end
