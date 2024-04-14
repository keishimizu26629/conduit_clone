class AddDefaultToLikesInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column_default :posts, :likes, from: nil, to: 0
  end
end
