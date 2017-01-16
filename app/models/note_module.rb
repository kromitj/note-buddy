class NoteModule < ApplicationRecord
	
	# associations
	belongs_to :topic
	has_many :note_tags, class_name: "NoteTag"
	has_many :note_resources
	has_many :note_questions
	has_many :note_generals
	has_many :note_terms

end
