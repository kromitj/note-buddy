class CreateNoteResources < ActiveRecord::Migration[5.0]
  def change
    create_table :note_resources do |t|
    	t.integer :note_module_id
    	t.string :title
    	t.string :resource_url

        t.timestamps
    end
  end
end
