class User < ApplicationRecord
    validates :username, presence: true, 
               uniqueness: {case_sensitive: false}, 
               length: {minimum: 6, maximum: 25}
    before_save {self.email = email.downcase}
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
               uniqueness: {case_sensitive: false},
               length: {maximum: 100},
               format: {with: VALID_EMAIL_REGEX}
    has_secure_password

    has_many :event_attendances, dependent: :destroy
    has_many :attended_events, :through => :event_attendances, source: :event
end
