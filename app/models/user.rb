class User < ApplicationRecord
    has_many :event_attendances
    has_many :events, :through => :event_attendances
end
