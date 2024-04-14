class RemoveCreateDateFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :create_date, :datetime
  end
end
