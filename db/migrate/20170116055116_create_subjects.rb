class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
    	t.integer :parent_id
    	t.string :title
    	t.integer :user_id # need to change this to note_taker_id

        t.timestamps null: false
    end
  end
end
