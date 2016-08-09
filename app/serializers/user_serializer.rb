class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :firstname, :lastname, :password
end
