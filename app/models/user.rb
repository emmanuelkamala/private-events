class User < ApplicationRecord
    validates :username, presence: true, 
               uniqueness: {case_sensitive: false}, 
               length: {minimum: 6, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\W+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
               uniqueness: {case_sensitive: false},
               length: {maximum: 100},
               format: {with: VALID_EMAIL_REGEX}
    has_secure_password
    has_many :event_attendances
    has_many :events, :through => :event_attendances
end
