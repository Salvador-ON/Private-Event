class Event < ApplicationRecord
belongs_to :user
has_many :attendances
validates :event_date, presence: true
default_scope -> { order(event_date: :asc) }
end
