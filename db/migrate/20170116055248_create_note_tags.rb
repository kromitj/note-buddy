class CreateNoteTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :tags, :note_modules, table_name: :note_tags do |t|

      t.timestamps
    end
  end
end
