class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :time, :description, :private, :longitude, :latitude

  attributes :invited do |object|
    object.players.invited do |player|
      PlayerSerializer.new(player).serializable_hash
    end
  end

  attributes :maybe do |object|
    object.players.maybe do |player|
      PlayerSerializer.new(player).serializable_hash
    end
  end

  attributes :going do |object|
    object.players.going do |player|
      PlayerSerializer.new(player).serializable_hash
    end
  end
end
