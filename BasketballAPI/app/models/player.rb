class Player < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :game

  # Validations
  validates_presence_of :user_id, :game_id, :status
  validates_inclusion_of :status, in: %w[invited going maybe not_going], message: "is not an option", allow_blank: true
  validates_uniqueness_of :user_id, scope: %i[game_id]

  # Scopes
  scope :invited, -> { where(status: 'invited') }
  scope :going, -> { where(status: 'going') }
  scope :maybe, -> { where(status: 'maybe') }
  scope :not_going, -> { where(status: 'not_going') }
  scope :for_game, -> (game_id) { where('game_id = ?', game_id) }
  scope :for_user, -> (user_id) { where('user_id = ?', user_id) }
  scope :alphabetical, ->  { joins(:user).order('firstname, lastname') }
  scope :chronological, ->  { joins(:game).order('date ASC, time ASC') }

end
