class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances
  validates :event_date, presence: true
  default_scope -> { order(event_date: :asc) }

  scope :upcoming, -> { where('event_date >= ?', Time.now.strftime('%Y-%d-%m')) }
  scope :past, -> { where('event_date < ?', Time.now.strftime('%Y-%d-%m')) }
end
