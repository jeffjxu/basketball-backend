class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :email, :firstname, :lastname, :dob, :phone

  attribute :players do |object|
    object.players.map do |player|
      PlayerSerializer.new(player).serializable_hash
    end
  end

  attribute :favorites do |object|
    Favorite.for_favoriter(object.id).map do |favorite|
      FavoriteSerializer.new(favorite).serializable_hash
    end
  end

  # attributes :favoritees do |object|
  #   Favorite.for_favoritee(object.id).user
  # end
end
