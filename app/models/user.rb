class User < ActiveRecord::Base
    has_secure_password
    has_many :analog_synthesizers
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: { in: 6..20 }

end
