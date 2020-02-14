class User < ActiveRecord::Base
    has_many :dogs

    has_secure_password

    validates :username, presence: true, uniqueness: true
end
