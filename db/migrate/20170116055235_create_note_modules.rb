class CreateNoteModules < ActiveRecord::Migration[5.0]
  def change
    create_table :note_modules do |t|
    	t.integer :topic_id
    	t.string :module_type

        t.timestamps null: false
    end
  end
end
