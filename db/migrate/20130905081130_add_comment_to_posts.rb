class AddCommentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :comment_id, :string
    add_index :posts, :user_id, :comment_id
  end
end
