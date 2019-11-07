class Event < ApplicationRecord
    validates_presence_of :title, :description, :location, :date 
    scope :upcoming, -> { where('date >= ?', Time.zone.now) }
    scope :past, -> { where('date < ?', Time.zone.now) }

    belongs_to :user
    has_many :event_attendances, foreign_key: :event_id
    has_many :users, :through => :event_attendances
end
