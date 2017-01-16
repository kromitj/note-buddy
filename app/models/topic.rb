class Topic < ApplicationRecord
	
	# associations
	belongs_to :subject
	has_many :note_modules
	has_many :note_resources, through: :note_modules
	has_many :note_questions, through: :note_modules
	has_many :note_generals, through: :note_modules
	has_many :note_terms, through: :note_modules
end
