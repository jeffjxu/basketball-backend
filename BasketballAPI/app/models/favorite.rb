class Favorite < ApplicationRecord
  belongs_to :favorater, :class_name => "User"
  belongs_to :favoritee, :class_name => "User"
end
