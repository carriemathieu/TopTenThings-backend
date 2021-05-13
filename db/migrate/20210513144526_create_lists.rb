class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.integer :category_id
      t.text :list_content, array: true, default: []
      t.string :list_title

      t.timestamps
    end
  end
end
