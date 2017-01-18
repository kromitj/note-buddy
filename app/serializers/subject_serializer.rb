class SubjectSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :parent_id, :title
	class UserSerializer < ActiveModel::Serializer
		attributes :id, :f_name, :l_name, :username, :password_digest
	end	
end