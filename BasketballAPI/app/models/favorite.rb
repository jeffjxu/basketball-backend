class Favorite < ApplicationRecord
<<<<<<< HEAD
  belongs_to :favoriter, :class_name => "User"
=======
  belongs_to :favorater, :class_name => "User"
>>>>>>> f4988944379666d8a73211cc911ee0528ff79152
  belongs_to :favoritee, :class_name => "User"
end
