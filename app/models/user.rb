class User < ApplicationRecord
	# require User to have password_digest attr
	# has_secure_password

	# associations
	has_many :subjects
	has_many :topics, through: :subject

end
