class Event < ApplicationRecord
    has_many :event_attendances
    has_many :users, :through => :event_attendances
    validates_presence_of :title, :description, :location, :date 
end
