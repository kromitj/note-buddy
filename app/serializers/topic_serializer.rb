class TopicSerializer < ActiveModel::Serializer
  belongs_to :subject
  attributes :id, :subject_id, :title
	class SubjectSerializer < ActiveModel::Serializer
	  belongs_to :user
	  attributes :id, :parent_id, :title, :user_id
	end
end