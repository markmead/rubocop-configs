class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.boolean :live, default: false
      t.string :gem
      t.string :title
      t.text :config

      t.timestamps
    end
  end
end
