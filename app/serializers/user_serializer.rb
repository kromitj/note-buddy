class UserSerializer < ActiveModel::Serializer
  attributes :id, :f_name, :l_name, :username, :password_digest
end