class Game < ApplicationRecord
    # Relationships
    has_many :players

    # Validations
    validates_presence_of :name, :date, :time, :longitude, :latitude
    validates :private, inclusion: { in: [ true, false ] }
    validates_date :date, on_or_after: :today
    validates_time :time
    validates :longitude, numericality: { only_integer: false }
    validates :latitude, numericality: { only_integer: false }

    # Scopes 
    scope :public_games, -> { where(private: false) }
    scope :private_games, -> { where(private: true) }
    scope :in_date_range, -> (start_date, end_date) { where('date BETWEEN ? AND ?', start_date, end_date) }
    scope :upcoming, -> { where('date >= ?', Date.today) }
    # TODO: get games within a certain distance from given coordinate
    scope :chronological, lambda { order('date ASC, time ASC') }

end
