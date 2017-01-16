class CreateNoteTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :note_terms do |t|
    	t.integer :note_module_id
    	t.string :term
    	t.string :definition

        t.timestamps
    end
  end
end
