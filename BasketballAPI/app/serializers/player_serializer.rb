class PlayerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :status

  attribute :game do |object|
    GameSerializer.new(object.game).serializable_hash
  end
end
