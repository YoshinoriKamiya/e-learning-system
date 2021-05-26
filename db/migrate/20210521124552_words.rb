class Words < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.integer :category_id
      t.string :word

      t.timestamps
    end
    add_index :words, [:category_id]
  end
end
