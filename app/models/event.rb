class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances
  validates :event_date, presence: true

  scope :upcoming, -> { where('event_date >= ?', Time.now.strftime('%Y-%m-%d')).order(event_date: :asc) }
  scope :past, -> { where('event_date < ?', Time.now.strftime('%Y-%m-%d')).order(event_date: :desc) }
end
