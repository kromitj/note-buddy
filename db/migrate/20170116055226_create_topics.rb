class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
    	t.integer :subject_id
    	t.string :title

        t.timestamps null: false
    end
  end
end
