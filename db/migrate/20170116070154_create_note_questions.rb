class CreateNoteQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :note_questions do |t|
    	t.integer :note_module_id
    	t.string  :note_question 
    	t.integer :google_responce_id


        t.timestamps
    end
  end
end
