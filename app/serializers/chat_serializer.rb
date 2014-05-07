class ChatSerializer < ActiveModel::Serializer
  attributes :content, :created_at
  has_one :user
end
