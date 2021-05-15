class User < ActiveRecord::Base
    has_secure_password
    has_many :analog_synthesizers
    validates :username, uniqueness: true
end
