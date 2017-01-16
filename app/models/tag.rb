class Tag < ApplicationRecord
	has_many :note_tags, class_name: "NoteTag"
end
