class CreateNoteGenerals < ActiveRecord::Migration[5.0]
  def change
    create_table :note_generals do |t|
    	t.integer :note_module_id
    	t.string :note_content

        t.timestamps 
    end
  end
end
