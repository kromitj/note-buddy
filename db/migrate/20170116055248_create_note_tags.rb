class CreateNoteTags < ActiveRecord::Migration[5.0]
  def change
    create_table :note_tags do |t|

      t.timestamps
    end
  end
end
