class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :first_name, :last_name, :dob, :phone

  attributes :games do |object|
    object.games.upcoming do |game|
      GameSerializer.new(game).serializable_hash
    end
  end

  attributes :favorites do |object|
    Favorite.for_favoriter(object.id).user
  end

  attributes :favoritees do |object|
    Favorite.for_favoritee(object.id).user
  end
end
