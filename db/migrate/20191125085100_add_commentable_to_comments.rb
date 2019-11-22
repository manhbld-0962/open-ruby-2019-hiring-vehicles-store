class AddCommentableToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string

    add_reference :comments, :user, index: true
  end
end
