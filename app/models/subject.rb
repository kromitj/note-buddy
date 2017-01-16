class Subject < ApplicationRecord
	
	# associations
	belongs_to :user 
	has_many :topics
	has_many :note_modules, through: :topics

end
