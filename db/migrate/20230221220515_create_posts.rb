class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }, on_delete: :cascade
      t.string :title
      t.text :text
      t.integer :likes_counter, default: 0
      t.integer :comments_counter, default: 0
      t.timestamps
    end
  end
end

# rails g migration CreatePosts author_id:references:users title:text text:text updated_at:datetime created_at:datetime likes_counter:integer comments_counter:integer
# to rollback: rails db:rollback
