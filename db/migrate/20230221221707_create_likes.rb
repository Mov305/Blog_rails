class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: { to_table: :users } ondelete: :cascade
      t.references :post, null: false, foreign_key: { to_table: :posts } ondelete: :cascade
      t.timestamps
    end
  end
end


