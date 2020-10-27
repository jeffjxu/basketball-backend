class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :favoriter_id, :favoritee_id

  attribute :user do |object|
    UsersSerializer.new(object.favoritee).serializable_hash
  end
end
