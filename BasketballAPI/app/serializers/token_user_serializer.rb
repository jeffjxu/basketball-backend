class TokenUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :api_key
end