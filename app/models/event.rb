class Event < ApplicationRecord
    validates_presence_of :title, :description, :location, :date 
    scope :upcoming, -> { where('date >= ?', Time.zone.now) }
    scope :past, -> { where('date < ?', Time.zone.now) }

    belongs_to :user
    has_many :event_attendances, dependent: :destroy
    has_many :attendees, :through => :event_attendances, source: :user
end
