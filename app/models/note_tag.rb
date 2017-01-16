class NoteTag < ApplicationRecord

	# associations
	belongs_to :tag 
	belongs_to :note_module
end
