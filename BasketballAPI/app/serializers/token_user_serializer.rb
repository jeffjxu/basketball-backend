class TokenUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :firstname, :lastname, :dob, :phone, :api_key
end