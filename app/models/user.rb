class User < ActiveRecord::Base
    before_save{ self.remember_token = User.hash(remember_token) }
    before_save{ self.email = email.downcase }

    has_many :trips_users
    has_many :trips, through: :trips_users
    has_many :trips_owned, :class_name => "Trip", :foreign_key => "owner_id"
    has_many :chats

    has_secure_password

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.hash(token)
        Digest::SHA1.hexdigest(token.to_s)
    end
end
