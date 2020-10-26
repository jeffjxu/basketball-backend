class PlayerSerializer
  include FastJsonapi::ObjectSerializer

  attributes :user do |object|
    object.user
  end
end
