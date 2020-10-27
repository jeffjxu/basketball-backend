class GamesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :date, :time, :description, :private, :longitude, :latitude
end
