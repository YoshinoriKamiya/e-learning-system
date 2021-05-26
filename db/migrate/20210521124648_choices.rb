class Choices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.integer :word_id
      t.string :choice
      t.boolean :correct_ans

      t.timestamps
    end
    add_index:choices, [:word_id]
  end
end
