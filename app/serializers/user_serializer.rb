class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :college, :age, :gender, :major
end
