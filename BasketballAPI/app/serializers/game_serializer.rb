class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :date, :time, :description, :private, :longitude, :latitude

  attribute :invited do |object|
    object.players.invited.alphabetical.map do |player|
      UsersSerializer.new(player.user).serializable_hash
    end
  end

  attribute :maybe do |object|
    object.players.maybe.alphabetical.map do |player|
      UsersSerializer.new(player.user).serializable_hash
    end
  end

  attribute :going do |object|
    object.players.going.alphabetical.map do |player|
      UsersSerializer.new(player.user).serializable_hash
    end
  end
end
