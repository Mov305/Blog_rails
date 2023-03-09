class Likes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, primary_key: %i[user_id post_id] do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
